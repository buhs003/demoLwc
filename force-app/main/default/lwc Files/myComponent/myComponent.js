import { LightningElement } from 'lwc';
import MyDataType from './myDataType.js';

export default class MyComponent extends LightningElement {

    myDataList = [
        new MyDataType('John', 25),
        new MyDataType('Jane', 30),
        new MyDataType('Bob', 40)
      ];

      columns = [
        { label: 'Name', fieldName: 'name' },
        { label: 'Age', fieldName: 'age' },
        {
          label: 'Custom Data Type',
          type: 'customDataType',
          fieldName: 'customDataType',
          typeAttributes: {
            template: 'customDataTypeTemplate',
            // Other type attributes if needed
          }
        }
      ];
    
      // Custom data type template for rendering the custom data type
      customDataTypeTemplate = ({ value }) => {
        // Render custom data type value
        return `${value.name} - ${value.age}`;
      };
}