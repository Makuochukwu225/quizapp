
const QuestionModel = require("../models/question.model");


class QuestionService{
    static async createQuestion(userId,questionText,options){
            const createQuestion = new QuestionModel({userId,questionText,options});
            return await createQuestion.save();
    }

    static async updateQuestion(userId,questionText,options){
     const createQuestion = new QuestionModel({userId,questionText,options});
     return await createQuestion.save();
}

static async getQuestionById(id){
     try{
         return await QuestionModel.findById(id);
     }catch(err){
         console.log(err);
     }
 }

    static async getUserQuestionList(userId){
        const questionList = await QuestionModel.find({userId})
        return questionList;
   }

   static async deleteQuestion(id){
        const deleted = await QuestionModel.findByIdAndDelete({_id:id})
        return deleted;
   }
}

module.exports = QuestionService;