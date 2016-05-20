HTMLWidgets.widget({

  name: 'C3Gauge',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

  renderValue: function(x) {
        // create a chart and set options
        // note that via the c3.js API we bind the chart to the element with id equal to chart1
        var chart = c3.generate({
            bindto: el,
            data: {
                json: x['data'],
                type: 'gauge'
            },
            gauge: {
                label:{
                    //returning here the value and not the ratio
                    format: function(value, ratio){ return value;}
                },
                min: 0,
                max: 1,
                width: x['width'],
                units: 'value' //this is only the text for the label
            },
	          color:{
	            pattern: ['#FF0000', '#F97600', '#F6C600', '#60B044'], // the four color levels for the percentage values.
              threshold: {
            values: [.20, .40, .60, 1]
        }
	  }
        });
              
      },
      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});