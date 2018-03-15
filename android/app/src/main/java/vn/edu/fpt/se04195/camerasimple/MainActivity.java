package vn.edu.fpt.se04195.camerasimple;

import android.app.ProgressDialog;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;

//import android.media.FaceDetector;
import android.graphics.PointF;
import android.media.FaceDetector;
import android.media.Image;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Environment;
import android.provider.MediaStore;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import android.util.Base64;
import android.util.Log;
import android.util.SparseArray;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.vision.Frame;
import com.google.android.gms.vision.face.Face;
//import com.google.android.gms.vision.face.FaceDetector;
import com.google.android.gms.vision.face.Landmark;


import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import static java.security.AccessController.getContext;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {
    static final int REQUEST_IMAGE_CAPTURE = 1;
    static final int REQUEST_TAKE_PHOTO = 2;
    static final int REQUEST_EDIT_PHOTO = 3;
    static final int NUMBER_OF_FACES = 35;
    public static final String UPLOAD_URL = "http://10.21.10.105/TakeAttendance/upload.php";
    public static final String UPLOAD_KEY = "image";
    public static final String UPLOAD_USER = "username";
    String userName;
    String mCurrentPhotoPath;
    Button btnCamera, btnGallery, btnEdit, btnSend;
    ImageView imgPhoto;
    Uri photoURI;
    InputStream imageStream;
    Bitmap bitmapImage;
    FaceDetector faceDetector;
    FaceDetector.Face[] detectedFaces;
    SparseArray<Face> mFaces;
    TextView txtUser;
    int number_face;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        btnCamera = (Button) findViewById(R.id.btnCamera);
        btnGallery = (Button) findViewById(R.id.btnPhoto);
        btnEdit = (Button) findViewById(R.id.btnEdit);
        btnSend = (Button) findViewById(R.id.btnSend);
        imgPhoto = (ImageView) findViewById(R.id.imgPhoto);
        txtUser = (TextView) findViewById(R.id.txtUser);
        btnCamera.setOnClickListener(this);
        btnGallery.setOnClickListener(this);
        btnEdit.setOnClickListener(this);
        btnSend.setOnClickListener(this);


        Intent intent = this.getIntent();
        Bundle bundle = intent.getBundleExtra("bundle");
        userName = bundle.getString("userName");
        txtUser.setText("Hi " + userName);
    }

    @Override
    public void onClick(View v) {
        int UI_id = v.getId();
        switch (UI_id) {
            case R.id.btnQuit:
                finish();
            case R.id.btnCamera:
                takePhotoByCamera();
                break;
            case R.id.btnPhoto:
                takePhotoFromGallery();
                break;
            case R.id.btnEdit:
                editImage();
                break;
            case R.id.btnSend:
                Boolean flag = checkConnection();

                if (flag) {
                    uploadImage();
                } else {
                    Toast.makeText(MainActivity.this, "Don't have internet connection!",
                            Toast.LENGTH_SHORT).show();
                }
//                bitmapImage = bitmapImage.copy(Bitmap.Config.RGB_565, false);
//                detectedFaces = new FaceDetector.Face[NUMBER_OF_FACES];
//                faceDetector = new FaceDetector(bitmapImage.getWidth(), bitmapImage.getHeight(), NUMBER_OF_FACES);
//                number_face = faceDetector.findFaces(bitmapImage, detectedFaces);
//                detectFaces2();

//                faceDetector = new FaceDetector.Builder(this)
//                        .setTrackingEnabled(false)
//                        .setMode(FaceDetector.ACCURATE_MODE)
//                        .setLandmarkType(FaceDetector.ALL_LANDMARKS)
//                        .setClassificationType(FaceDetector.NO_CLASSIFICATIONS)
//                        .build();
//                Frame frame = new Frame.Builder().setBitmap(bitmapImage).build();
//                mFaces = faceDetector.detect(frame);
//                int number_face =  mFaces.size();
//                detectFaces();
//                detector.release();


        }
    }
    private boolean checkConnection(){
        ConnectivityManager check = (ConnectivityManager)
                MainActivity.this.getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo[] info = check.getAllNetworkInfo();
        for (int i = 0; i < info.length; i++) {
            if (info[i].getState() == NetworkInfo.State.CONNECTED) {
                return  true;
            }
        }
        return false;
    }
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == REQUEST_IMAGE_CAPTURE && resultCode == RESULT_OK) {
            galleryAddPic();
            try {
                imageStream = getContentResolver().openInputStream(photoURI);
                bitmapImage = BitmapFactory.decodeStream(imageStream);
                imgPhoto.setImageBitmap(bitmapImage);
            } catch (Exception e) {
                Toast.makeText(this, "Error to show image", Toast.LENGTH_SHORT).show();
                Log.i("debug", e.getMessage());
            }
        }
        if (requestCode == REQUEST_TAKE_PHOTO && resultCode == RESULT_OK) {
            try {
                photoURI = data.getData();
                imageStream = getContentResolver().openInputStream(photoURI);
                bitmapImage = BitmapFactory.decodeStream(imageStream);
                imgPhoto.setImageBitmap(bitmapImage);
            } catch (FileNotFoundException e) {
                e.printStackTrace();
                Toast.makeText(this, "Something went wrong", Toast.LENGTH_LONG).show();
            }

        }
        if (requestCode == REQUEST_EDIT_PHOTO && resultCode == RESULT_OK) {
            try {
                if (data != null) {
                    Bundle bundle = data.getExtras();
                    bitmapImage = bundle.getParcelable("data");
                    imgPhoto.setImageBitmap(bitmapImage);
                } else {
                    Toast.makeText(this, "Data error!!!", Toast.LENGTH_SHORT).show();
                }

            } catch (Exception e) {
                Toast.makeText(this, "Edit error!!!", Toast.LENGTH_SHORT).show();
            }
        }
    }


    // function to take photo by camera
    private void takePhotoByCamera() {
        Intent takePictureIntent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
        File folder = new File(Environment.getExternalStorageDirectory() + File.separator + "Pictures" + File.separator + "PRM391");
        if (!folder.exists()) {
            folder.mkdirs();
        }
        File file = new File(Environment.getExternalStorageDirectory() + File.separator + "Pictures" + File.separator + "PRM391", "file" + String.valueOf(System.currentTimeMillis()) + ".jpg");
        photoURI = Uri.fromFile(file);
        mCurrentPhotoPath = file.getAbsolutePath();
        takePictureIntent.putExtra(MediaStore.EXTRA_OUTPUT, photoURI);
        takePictureIntent.putExtra("return-data", true);
        startActivityForResult(takePictureIntent, REQUEST_IMAGE_CAPTURE);

    }

    // get photo from Gallary
    private void takePhotoFromGallery() {
        Intent photoPickerIntent = new Intent(Intent.ACTION_PICK);
        photoPickerIntent.setType("image/*");
        startActivityForResult(photoPickerIntent, REQUEST_TAKE_PHOTO);
    }

    private void editImage() {
        if (photoURI != null) {
            try {
                Intent cropImage = new Intent("com.android.camera.action.CROP");
                cropImage.setDataAndType(photoURI, "image/*");
                cropImage.putExtra("crop", true);
                cropImage.putExtra("OutputX", 180);
                cropImage.putExtra("OutputY", 180);
                cropImage.putExtra("scaleUpIfNeeded", true);
                cropImage.putExtra("return-data", true);
                startActivityForResult(cropImage, REQUEST_EDIT_PHOTO);
            } catch (ActivityNotFoundException e) {

            }
        } else {
            Toast.makeText(this, "Please take photo first!!!", Toast.LENGTH_SHORT).show();
        }
    }


    private File createImageFile() throws IOException {
        // Create an image file name
        String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
        String imageFileName = "JPEG_" + timeStamp + "_";
        File storageDir = getExternalFilesDir(Environment.DIRECTORY_PICTURES);
        File image = File.createTempFile(
                imageFileName,  /* prefix */
                ".jpg",         /* suffix */
                storageDir      /* directory */
        );

        // Save a file: path for use with ACTION_VIEW intents
        mCurrentPhotoPath = image.getAbsolutePath();
        return image;
    }

    private void galleryAddPic() {
        Intent mediaScanIntent = new Intent(Intent.ACTION_MEDIA_SCANNER_SCAN_FILE);
        File f = new File(mCurrentPhotoPath);
        Uri contentUri = Uri.fromFile(f);
        mediaScanIntent.setData(contentUri);
        this.sendBroadcast(mediaScanIntent);
    }

    private void detectFaces() {
        Bitmap bmp = Bitmap.createBitmap(bitmapImage.getWidth(), bitmapImage.getHeight(), bitmapImage.getConfig());
        Canvas canvas = new Canvas(bmp);
        canvas.drawBitmap(bitmapImage, 0, 0, null);

        Paint paint = new Paint();
        paint.setColor(Color.GREEN);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(5);

        Paint landmarkPaint = new Paint();
        landmarkPaint.setColor(Color.RED);
        landmarkPaint.setStyle(Paint.Style.STROKE);
        landmarkPaint.setStrokeWidth(5);


        if (mFaces.size() > 0) {
            for (int i = 0; i < mFaces.size(); ++i) {
                Face face = mFaces.valueAt(i);

                canvas.drawRect(
                        face.getPosition().x,
                        face.getPosition().y,
                        face.getPosition().x + face.getWidth(),
                        face.getPosition().y + face.getHeight(), paint);

                for (Landmark landmark : face.getLandmarks()) {
                    int cx = (int) (landmark.getPosition().x);
                    int cy = (int) (landmark.getPosition().y);
                    canvas.drawCircle(cx, cy, 5, landmarkPaint);
                }
            }

            imgPhoto.setImageBitmap(bmp);
            Toast.makeText(this, mFaces.size() + " faces detected", Toast.LENGTH_LONG).show();
        } else {
            Toast.makeText(this, "No faces detected", Toast.LENGTH_LONG).show();
        }
    }

    private void detectFaces2() {
        Bitmap bmp = Bitmap.createBitmap(bitmapImage.getWidth(), bitmapImage.getHeight(), bitmapImage.getConfig());
        Canvas canvas = new Canvas(bmp);
        canvas.drawBitmap(bitmapImage, 0, 0, null);

        Paint paint = new Paint();
        paint.setColor(Color.GREEN);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(5);

        Paint landmarkPaint = new Paint();
        landmarkPaint.setColor(Color.RED);
        landmarkPaint.setStyle(Paint.Style.STROKE);
        landmarkPaint.setStrokeWidth(5);


        if (number_face > 0) {
            for (int i = 0; i < number_face; i++) {
                FaceDetector.Face face = detectedFaces[i];
                Log.v("debugI", String.valueOf(i));
                Log.v("debug", face.toString());
                Log.v("debugEye", String.valueOf(face.eyesDistance()));
                Log.v("debugX", String.valueOf(face.pose(0)));
                Log.v("debugY", String.valueOf(face.pose(1)));
                Log.v("debugZ", String.valueOf(face.pose(2)));

                PointF point = new PointF();
                face.getMidPoint(point);
                float x = point.x;
                float y = point.y;

                canvas.drawRect(
                        x - face.eyesDistance(),
                        y - face.eyesDistance() * 1.5f,
                        x + face.eyesDistance(),
                        y + face.eyesDistance() * 1.5f, paint);


                int cx = (int) (point.x);
                int cy = (int) (point.y);
                canvas.drawCircle(cx, cy, 5, landmarkPaint);

            }
            imgPhoto.setImageBitmap(bmp);
            Toast.makeText(this, number_face + " faces detected", Toast.LENGTH_LONG).show();
        } else {
            Toast.makeText(this, "No faces detected", Toast.LENGTH_LONG).show();
        }
    }

    private void uploadImage() {
        class UploadImage extends AsyncTask<Bitmap, Void, String> {

            ProgressDialog loading;
            RequestHandler rh = new RequestHandler();

            @Override
            protected void onPreExecute() {
                super.onPreExecute();
                loading = ProgressDialog.show(MainActivity.this, "Uploading...", null, true, true);
            }

            @Override
            protected void onPostExecute(String s) {
                super.onPostExecute(s);
                loading.dismiss();
                Toast.makeText(getApplicationContext(), s, Toast.LENGTH_LONG).show();
                Log.i("debug", s);
            }

            @Override
            protected String doInBackground(Bitmap... params) {
                Bitmap bitmap = params[0];
                String uploadImage = getStringImage(bitmap);

                HashMap<String, String> data = new HashMap<>();

                data.put(UPLOAD_KEY, uploadImage);
                data.put(UPLOAD_USER, userName);
                String result = rh.sendPostRequest(UPLOAD_URL, data);

                return result;
            }
        }

        UploadImage ui = new UploadImage();
        ui.execute(bitmapImage);
    }

    public String getStringImage(Bitmap bmp) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        bmp.compress(Bitmap.CompressFormat.JPEG, 100, baos);
        byte[] imageBytes = baos.toByteArray();
        String encodedImage = Base64.encodeToString(imageBytes, Base64.DEFAULT);
        return encodedImage;
    }
}
