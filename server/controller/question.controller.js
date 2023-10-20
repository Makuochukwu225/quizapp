const QuestionService = require('../services/question.service');

exports.createQuestion = async (req, res, next) => {
    try {
        const { userId, questionText, options } = req.body;
        let questionData = await QuestionService.createQuestion(userId, questionText, options);
        res.json({ status: true,message:"Questions Created", data: questionData });
    } catch (error) {
        console.log(error, 'err---->');
        next(error);
    }
}

exports.updateQuestion = async (req, res, next) => {

    try {
        const { userId, questionText, options } = req.body;
        const { questionId } = req.params;
        console.log(questionId);
        const question = await QuestionService.getQuestionById(questionId);
        if (!question) {
            return res.status(404).json({status: false, message: 'Question not found' });
        }

        let questionData = await QuestionService.updateQuestion(userId, questionText, options);
        res.json({ status: true,message:"Questions updated", data: questionData });
    } catch (error) {
        console.log(error, 'err---->');
        next(error);
    }
}

exports.getQuestionList = async (req, res, next) => {
    try {
        const { userId } = req.body;
        let questionData = await QuestionService.getUserQuestionList(userId);
        res.json({ status: true,message:"Questions fetched", data: questionData });
    } catch (error) {
        console.log(error, 'err---->');
        next(error);
    }
}

exports.deleteQuestion = async (req, res, next) => {
    try {
        const { id } = req.body;
        let deletedData = await QuestionService.deleteQuestion(id);
        res.json({ status: true, success: deletedData });
    } catch (error) {
        console.log(error, 'err---->');
        next(error);
    }
}