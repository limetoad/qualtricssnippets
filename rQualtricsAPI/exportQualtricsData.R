################################################################################
# To use this function, follow this format:                                    #
#                                                                              #
# exportQualtricsData("username", "token", "format", "SurveyID")               #
#                                                                              #
# Replace "username", "token", "format", and "surveyID" with your own values.  #
#                                                                              #
# Acknowledgement - This function was adapted from Jason Beyer's function. It  #
# has been improved to handle more username types and has the updated api.     #
################################################################################

exportQualtricsData = function (username, token, format, surveyID, dropExtra = FALSE) {
  url = paste("https://survey.qualtrics.com//WRAPI/ControlPanel/api.php?Version=2.5&Request=getLegacyResponseData",
              "&User=", username,
              "&Token=", token,
              "&Format=", format,
              "&SurveyID=", surveyID,
              "&ExportTags=1",
              sep = "")

  url = gsub("[@]", "%40", url)

  url = gsub("[#]", "%23", url)

  exportQualtricsData = read.csv(url)

  exportQualtricsData = exportQualtricsData[-1, ]

  if (dropExtra==TRUE) {

    exportQualtricsData[-c(1:10)]

  }

  else {exportQualtricsData}
}