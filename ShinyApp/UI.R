library(shiny) 
shinyUI(
    pageWithSidebar(
        # Application title
        headerPanel("Shiny Application Project - Body Mass Index (BMI) Calculator"),
        
        sidebarPanel(
            numericInput('weight', 'Weight (lbs)', 100) ,
            numericInput('height', 'Height (in)', 60, min = 50, max = 100, step = 10),
            submitButton('Submit')
        ), 
        mainPanel(
            p('The Body mass index (BMI) is a measure of body fat based on height and weight. It applies to both men and women between the ages of 18 and 65 years.'),
            p('BMI can be used to indicate if you are obese, overweight, normal, or underweight. A healthy BMI score is between 20 and 25.'),
            p('The World Health Organization (WHO) proposes the following classifications for BMI measurements:'),
            tags$div(
                tags$ul(
                    tags$li('BMI <18.5       : Underweight'),
                    tags$li('BMI [18.5-24.9] : Normal Weight'),
                    tags$li('BMI [25-29.9]   : Overweight'),
                    tags$li('BMI >=30        : Obese')
                )
            ),
            
            h4('Calculating BMI based on your height and weight:'), 
            p('Weight (lbs):'), verbatimTextOutput("inputweightvalue"),
            p('Height (in):'), verbatimTextOutput("inputheightvalue"),
            h4('Your BMI is:'),
            verbatimTextOutput("estimation"),
            p('This indicates that you are:'),strong(verbatimTextOutput("diagnostic"))
            
        )
    )   
)
