const router = require("express").Router();
const QuestionController = require('../controller/question.controller')

router.post("/createQuestion",QuestionController.createQuestion);

router.get('/getUserQuestionList',QuestionController.getQuestionList);

router.post("/deleteQuestion",QuestionController.deleteQuestion);

router.put("/updateQuestion/:questionId",QuestionController.updateQuestion);



module.exports = router;