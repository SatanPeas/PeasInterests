<%--
  Created by IntelliJ IDEA.
  User: SatanPeas
  Date: 2017/11/5
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/common/jsp/common.jsp"%>
<html>
  <head>

    <style>
      .container{
        height:100%;
      }

    </style>
  </head>

  <body>
    <div id="root" class="container"></div>
    <script type="text/babel">
        class Reservation extends React.Component {
            constructor(props) {
                super(props);
                this.state = {
                    name: "",
                    password: ""
                };

                this.handleInputChange = this.handleInputChange.bind(this);

            }

            handleInputChange(event) {
                const target = event.target;
                const value = target.value;
                const name = target.name;

                this.setState({
                    [name]: value
                });
            }

            render() {
                return (
                    <div style={{position: 'relative',top: '50%',transform: 'translateY(-50%)'}}>
                      <form action="login.form" method="POST">
                        <div className="row">
                          <div className="form-group col-lg-4 col-lg-offset-4">
                            <input
                              id="name"
                              name="name"
                              type="text"
                              className="form-control"
                              placeholder="NAME"
                              value={this.state.name}
                              onChange={this.handleInputChange} />
                          </div>
                        </div>
                        <div className="row">
                          <div className="form-group col-lg-4 col-lg-offset-4">
                              <input
                                name="password"
                                type="password"
                                className="form-control"
                                placeholder="PASSWORD"
                                value={this.state.password}
                                onChange={this.handleInputChange} />

                          </div>
                        </div>
                        <div className="row">
                          <div className="form-group col-lg-4 col-lg-offset-4" style={{textAlign: "center"}}>
                            <input type="Submit" value="Sign In" className="btn btn-primary" />
                          </div>
                        </div>
                      </form>
                    </div>
                );
            }
        }

        ReactDOM.render(
            <Reservation />,
            document.getElementById('root')
        );

    </script>
  </body>
</html>
