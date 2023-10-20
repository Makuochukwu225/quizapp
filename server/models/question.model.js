const db = require('../config/db');
const UserModel = require("./user.model");
const mongoose = require('mongoose');
const { Schema } = mongoose;

const optionSchema = new mongoose.Schema({
    text: {
        type: String,
        required: true,
    },
    isCorrect: {
        type: Boolean,
        required: true,
    },
});


const questionSchema = new Schema({
    userId: {
        type: Schema.Types.ObjectId,
        ref: UserModel.modelName
    },
    questionText: {
        type: String,
        required: true,
    },
    options: {
        type: [optionSchema], // Use the optionSchema for the array
        validate: [
            {
              validator: function (options) {
                return options.length > 3;
              },
              message: 'four option is required.',
            },
          ], // Make the array itself required
    },
}, { timestamps: true },);

function hasAtLeastOneOption(value) {
    return value.length > 0;
  }

const QuestionModel = db.model('question', questionSchema);
module.exports = QuestionModel;