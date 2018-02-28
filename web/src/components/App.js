import React from 'react';
import { Link } from 'react-router';
import { version } from '../../package.json';
import { Button } from 'semantic-ui-react';

const appStyle = {
  position: 'relative',
  top: 20
};

const App = ({ children }) => (
  <div className="ui one column stackable center aligned page grid app-layout" style={appStyle}>
    <div className="column sixteen wide ">
      <header>
        <div className="app-name"><Link to="/">iAttendance {version}</Link></div>
        <div className="nav-bar">
          {!sessionStorage.loggedIn &&
            <Link to="/login"><Button color="purple">Login</Button></Link>}
          {!sessionStorage.loggedIn &&
          <Link to="/register"><Button color="purple">Register</Button></Link>}
          {sessionStorage.loggedIn &&
            <Link to="/sample"><Button color="purple">Sample page</Button></Link>}
          {sessionStorage.loggedIn &&
            <Link to="/logout"><Button color="purple">Logout</Button></Link>}
        </div>
      </header>
      <br /><br /><br /><br />
      <section className="container ui grid centered">
        {children}
      </section>
      <br />
      <div className="footer">
        <p>&copy; 2018 ManhNT </p>
      </div>
    </div>
  </div>
);

App.propTypes = { children: React.PropTypes.object };

export default App;

