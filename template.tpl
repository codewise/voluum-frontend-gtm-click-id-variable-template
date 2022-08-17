___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Voluum Click ID variable",
  "categories": ["ANALYTICS","AFFILIATE_MARKETING","CONVERSIONS"],
  "description": "Voluum Click ID Variable template is a simple way of obtaining Click ID from your Voluum Tracking Script or Offer URL (Query URL).",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "RADIO",
    "name": "variableType",
    "displayName": "Tracking type",
    "radioItems": [
      {
        "value": "direct",
        "displayValue": "Click ID for Direct Tracking",
        "help": "Get your Click ID from the dtpCallback function."
      },
      {
        "value": "redirect",
        "displayValue": "Click ID for Redirect Tracking",
        "help": "Get your Click ID from the URL query."
      }
    ],
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "customClickID",
    "displayName": "Click ID parameter name",
    "simpleValueType": true,
    "enablingConditions": [
      {
        "paramName": "variableType",
        "paramValue": "redirect",
        "type": "EQUALS"
      }
    ],
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Enter your template code here.
const copyFromWindow = require('copyFromWindow');
const getQueryParameters = require('getQueryParameters');

if (data.variableType === "redirect") {
    return getQueryParameters(data.customClickID);
}
else {
    const dtpCallback = copyFromWindow("dtpCallback");
  
    return dtpCallback.getClickID();
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "dtpCallback"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_url",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urlParts",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "queriesAllowed",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 17/08/2022, 14:38:21

