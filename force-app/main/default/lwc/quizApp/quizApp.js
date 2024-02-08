import { LightningElement } from 'lwc';

export default class QuizApp extends LightningElement {
    selected = {}//for storing answeres
    correctAnsweres = 0//to show the result.
    isSubmitted = false//used to show the correct answerx

    myQuestions = [
        {
            id: "Question1",
            question: "Which one of the following is not a template loop?",
            answers: {
                a: "for:each",
                b: "iterator",
                c: "Map loop",
            },
            correctAnswer: "c"
        },
        {
            id: "Question2",
            question: "Which of the file is invalid in LWC Component folder?",
            answers: {
                a: ".svg",
                b: ".apex",
                c: ".js",
            },
            correctAnswer: "b"
        },
        {
            id: "Question3",
            question: "Which one of the following is not a directive?",
            answers: {
                a: "for:each",
                b: "if:true",
                c: "@track",
            },
            correctAnswer: "c"
        }
    ]
    //disabling the submit button until all que are answered.
    get allNotSelected() {
        //objects.keys gives array of the selected object.and if length is appended then we get the no of keys in the object.
        return !(Object.keys(this.selected).length === this.myQuestions.length)
    }
    //for applying dynamice styling to our result.
    get isScoredFull() {
        return `slds-text-heading_large ${this.myQuestions.length === this.correctAnsweres ?
            'slds-text-color_success' : 'slds-text-color_error'}`
    }
    //changehandler gets called on every click on the options.
    changeHandler(event) {
       const { name, value } = event.target
       this.selected = { ...this.selected, [name]: value }

    }
    //form submit handler
    submitHandler(event) {
        event.preventDefault()
        let correct = this.myQuestions.filter(item => this.selected[item.id] === item.correctAnswer)
        this.correctAnsweres = correct.length
        this.isSubmitted = true

    }
    //form reset handler
    resetHandler() {
        this.selected = {}
        this.correctAnsweres = 0
        this.isSubmitted = false

    }
}