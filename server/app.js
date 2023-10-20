const express = require("express");
const bodyParser = require("body-parser")
const UserRoute = require("./routes/user.routes");
const QuestionRoute = require('./routes/question.routes');
const app = express();

app.use(bodyParser.json())

 app.use("/",UserRoute);
 app.use("/",QuestionRoute);

module.exports = app;