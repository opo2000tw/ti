Polymer({is: "ti-rov-graph",
    behaviors: [
      rovBehaviors.viewBehaviors
    ],

    properties: {

        rows: {        /* our copy of the values being plotted */
            type:  Array,
            value: function() { return [];}
        },

        viewName: {
            type:  String,
            value: ''
        },

        viewRefresh: { /* recommended view state indicator */
            type:  Boolean,
            value: false
        },

        sample: {       /* sample number */
            type:  Number,
            value: 0
        },

        /* threshold for removing rows from the chart */
        MAX_ROWS: {     /* max number of rows to display */
            type:  Number,
            value: 2048
        },

        plJsTraces : {       /*  plotly line traces */
            type: Array,
            value: null
        },

        layout : {      /*  plotly layout */
            type: Object,
            value: null
        },

        VISIBLE_ROWS: { /* Visible x axis */
            type:  Number,
            value: 101
        },

        viewList : {
            type: Object,
            value: {}
        },

        maxValue : {    /* track y axis max to update range accordingly */
            type:  Number,
            value: 1000
        },

        minValue : {    /* track y axis min to update range accordingly */
            type:  Number,
            value: 0
        },

        graphName: {
            type: String,
            value: ''
        },

        sameModuleView : {
            type: Boolean,
            value: true
        },

        requests: {        /* outstanding requests */
            type: Number,
            value: 0
        },

        rovTraces : {
            type: Array,
            value: []
        },

        removeButtonHidden: {
            type: Boolean,
            value: false
        },

        selectedTrace: {
            type: Object,
            value: function() { return {};}
        },

        primaryKeyMenuItems: {
            type: Array,
            value: []
        },

        primaryKeyMenuLabel: {
            type: String,
            value: ''
        },

        xAxisLabel: {
            type: String,
            value: 'Sample Number'
        },

        yAxisLabel: {
            type: String,
            value: ''
        },

        graphWidth: {
            type:  Number,
            value: 390
        },
        graphHeight: {
            type:  Number,
            value: 264
        },

        primaryKeySectionHidden: {
            type: Boolean,
            value: false
        },

        persistProperties: {
            type: Array,
            value: ['graphName', 'rovTraces', 'xAxisLabel', 'yAxisLabel', 
                    'graphWidth', 'graphHeight', 'VISIBLE_ROWS']
        }
    },

/*
    rovTrace = {module,
                view,
                args,
                viewArgs,
                argsId,
                viewType,
                firstArg,
                selectedColumnName,
                primaryKeyColumnName,
                primaryKeyColumnValue,
                primaryKeyColumns,
                assignedTraceName,
                viewData,
                columns

    }
*/

    addTrace : function (newTrace) {
        if (this.$.chartOptionsMenuDialog.opened) {
            this.$.chartOptionsMenuDialog.close();
        }
        if (this.sameModuleView) {
            this.sameModuleView = this.isSameModuleView(this.rovTraces[0], newTrace);
        }
        this.rows.push({x:[], y:[]});

        var trace = {};
        trace.args = newTrace.args;
        trace.module = newTrace.module;
        trace.view = newTrace.view;
        trace.viewType = this.getViewType(trace.module, trace.view);
        trace.viewArgs = rovUtils.shallowCopy(newTrace.viewArgs);
        trace.argsId = newTrace.argsId;
        trace.selectedColumnName = newTrace.selectedColumnName;
        trace.primaryKeyColumnName = newTrace.primaryKeyColumnName;
        trace.primaryKeyColumnValue = newTrace.primaryKeyColumnValue;
        if (this.sameModuleView && this.rovTraces[0].viewData) {
            trace.viewData = this.rovTraces[0].viewData;
        }
        if (trace.args) {
            trace.firstArg = trace.args.substr(1, trace.args.indexOf(',') - 1);
        }
        else if (trace.viewType != 'MODULE') {
            trace.columns = this.getViewColumns(trace.module, trace.view);
            trace.primaryKeyColumns = [];
            for (var i = 0; i < trace.columns.length; i++) {
                if (trace.columns[i] != trace.selectedColumnName) {
                    trace.primaryKeyColumns.push(trace.columns[i]);
                }
            }
        }
        this.rovTraces.push(trace);
        this.set('removeButtonHidden', this.rovTraces.length == 1);
        var name = this.traceName(trace);
        this.plJsTraces.push(this.newTrace(name));
        Plotly.newPlot(this.$.graph, this.plJsTraces, this.layout, {displayModeBar: false, scrollZoom: true});
    },

    attached: function () {
        if (this.plJsTraces != null) {
            return;
        }
        this.rovTraces = [];
        this.viewList = document.querySelector('ti-rov-panel').getViewList();
        this.viewName = this.graphName;
        for (var i = 0; i < this.plotTraces.length; i++) {
            var trace = {};
            trace.args = this.plotTraces[i].args;
            trace.module = this.plotTraces[i].module;
            trace.view = this.plotTraces[i].view;
            trace.viewType = this.getViewType(trace.module, trace.view);
            trace.viewArgs = rovUtils.shallowCopy(this.plotTraces[i].viewArgs);
            trace.argsId = this.plotTraces[i].argsId;
            trace.selectedColumnName = this.plotTraces[i].selectedColumnName;
            trace.primaryKeyColumnName = this.plotTraces[i].primaryKeyColumnName;
            trace.primaryKeyColumnValue = this.plotTraces[i].primaryKeyColumnValue;
            trace.assignedTraceName = this.plotTraces[i].assignedTraceName;
            if (trace.args) {
                trace.firstArg = trace.args.substr(1, trace.args.indexOf(',') - 1);
            }
            else if (trace.viewType != 'MODULE') {
                trace.columns = this.getViewColumns(trace.module, trace.view);
                trace.primaryKeyColumns = [];
                for (var j = 0; j < trace.columns.length; j++) {
                    if (trace.columns[j] != trace.selectedColumnName) {
                        trace.primaryKeyColumns.push(trace.columns[j]);
                    }
                }
            }
            this.rovTraces.push(trace);
        }
        this.set('removeButtonHidden', this.rovTraces.length == 1);
        var graph = this.$.graph;

        graph.style.width = this.graphWidth + 'px';
        graph.style.height = this.graphHeight + 'px';

        /* initialize all our state */
        this.sameModuleView = true;
        for (var i = 0; i < this.rovTraces.length - 1; i++) {
            for (j = i + 1; j < this.rovTraces.length; j++) {
                if (!this.isSameModuleView(this.rovTraces[i], this.rovTraces[j])) {
                    this.sameModuleView = false;
                    break;
                }
            }
            if (!this.sameModuleView) {
                break;
            }
        }
        this.set('rows', []);
        this.set('plJsTraces', []);
        var name;
        for (var i = 0; i < this.rovTraces.length; i++) {
            this.rows.push({x:[], y:[]});
            name = this.traceName(this.rovTraces[i]);
            this.plJsTraces.push(this.newTrace(name));
        }
        this.layout = {
          xaxis: {
            title: this.xAxisLabel,
            showgrid: true,
            type: 'linear',
            range: [0, this.VISIBLE_ROWS - 1],
            tickmode: 'auto',
            nticks: 11,
            tickfont: {size: 11},
            titlefont: {size: 11},
            showline: true
          },
          yaxis: {
            title: this.yAxisLabel,
            type: 'linear',
            range: [0, this.maxValue],
            tickmode: 'auto',
            nticks: 6,
            tickfont: {size: 11},
            titlefont: {size: 11},
            showline: true,
            zeroline: false
          },
          width: this.graphWidth,
          height: this.graphHeight,
          autosize: true,
          margin: {
            l: 60,
            r: 20,
            b: 50,
            t: 10
          },
          showlegend: true,
          legend: {
            x: 0,
            y: 1,
            'orientation': 'h',
            'traceorder': 'normal',
            'yanchor': 'bottom',
            'xanchor': 'left',
            font: {size: 11}
          }
        };

        Plotly.newPlot(graph, this.plJsTraces, this.layout, {displayModeBar: false, scrollZoom: true});
        this.onRefresh();
    },

    axesLabelsClicked : function (e) {
        var dialog = this.$.axesLabelsDialog;
        dialog.resetFit();
        var left = e.x;
        if ((left + 225) > document.documentElement.clientWidth) {
            left = document.documentElement.clientWidth - 225;
        }
        dialog.style.left = left + 'px';
        dialog.style.top = event.y + 'px';
        dialog.open();
        dialog.style.zIndex = String(document.querySelector('ti-rov-panel').getMaxZindex() + 1);
        if (this.$.chartOptionsMenu.selected != undefined) {
            this.$.chartOptionsMenu.selected = -1;
        }
    },

    axesLabelsDialogOkClicked : function (e) {
        var update = false;
        if (this.$.xAxisInput.value != this.xAxisLabel) {
            this.xAxisLabel = this.$.xAxisInput.value;
            this.layout.xaxis.title = this.xAxisLabel;
            update = true;
        }
        if (this.$.yAxisInput.value != this.yAxisLabel) {
            this.yAxisLabel = this.$.yAxisInput.value;
            this.layout.yaxis.title = this.yAxisLabel;
            update = true;
        }
        if (update) {
            Plotly.update(this.$.graph, this.plJsTraces, this.layout);
        }
        this.$.axesLabelsDialog.close();
    },

    chartOptionsMenuItemClicked : function (e) {
        var selected = e.currentTarget.id;
        this.$.chartOptionsMenu.selected = -1;
        if (selected && selected.indexOf('Clicked') > 0) {
            this[selected](e); /* id of the item is the function name */
        }
    },

    chartSettingsClicked : function (e) {
        /* Init trace props submenu */
        this.$.traceNamesMenu.selected = -1;
        this.$.tracePropertiesSubMenu.close();
        var traceNamesMenuItems = [];
        var fullData = this.$.graph._fullData;
        for (var i = 0; i < fullData.length; i++) {
            var item = {};
            item.id = fullData[i].name;
            var color = fullData[i].line.color;
            item.style = 'background-color:' + color + ';border-color:' + color + ';cursor:pointer;';
            item.label = fullData[i].name.replace(/<br>/, ' ');
            item.traceId = 'trace_' + i;
            var trace = this.rovTraces[i];
            var titleStr = 'Module: ' + trace.module;
            if (trace.args) {
                if (trace.view == 'Variable') {
                    titleStr += '\nVariable: ' + trace.firstArg;
                }
                else {
                    titleStr += '\nView: ' + this.rovTraces[i].view;
                    var args = trace.viewArgs[trace.argsId].args;
                    for(var j = 0; j < args.length; j++) {
                        titleStr += '\n' + args[j].name + ': ' + args[j].value;
                    }
                }
            }
            else {
                titleStr += '\nView: ' + trace.view;
            }
            item.title = titleStr;
            traceNamesMenuItems.push(item);
        }
        this.set('traceNamesMenuItems', traceNamesMenuItems);

        var dialog = this.$.chartOptionsMenuDialog;
        dialog.resetFit();
        this.$.chartOptionsMenu.selected = -1;
        var left = e.x;
        var width = 180; /* ballpark from styling in html */
        if ((left + 200) > document.documentElement.clientWidth) {
            left = document.documentElement.clientWidth - 200;
        }
        dialog.style.left = left + 'px';
        var height = 30 + 10;
        var top = e.y - this.$.closeButton.offsetHeight;
        if (top + height > document.querySelector('ti-rov-panel').viewContainer.clientHeight) {
          top = top - height;
          if (top < 0) {
              top = 0;
          }
        }
        dialog.style.top = top + 'px';
        dialog.style.minWidth = width + 'px';
        dialog.open();
        dialog.style.zIndex = String(document.querySelector('ti-rov-panel').getMaxZindex() + 1);
    },

    closeChartOptionsClicked : function (e) {
        this.$.chartOptionsMenuDialog.close();
    },

    deleteTrace : function (e) {
        var i = Number(e.currentTarget.id.substr(e.currentTarget.id.indexOf('_') + 1));
        var traceNamesMenuItems = [];
        for (var j = 0; j < this.traceNamesMenuItems.length; j++) {
            if (j != i) {
                var k = traceNamesMenuItems.length;
                traceNamesMenuItems.push(this.traceNamesMenuItems[j]);
                traceNamesMenuItems[k].traceId = 'trace_' + k;
            }
        }
        this.set('traceNamesMenuItems', traceNamesMenuItems);
        document.querySelector('ti-rov-panel').removeTraceFromPlotViewData(this, this.rovTraces[i]);
        Plotly.deleteTraces(this.$.graph, i);
        this.rows.splice(i, 1);
        this.rovTraces.splice(i, 1);
        if (this.rovTraces.length == 1) {
            this.set('removeButtonHidden', true);
        }
    },

    displayTableView : function (e) {
        var i = Number(e.currentTarget.id.substr(e.currentTarget.id.indexOf('_') + 1));
        var trace = this.rovTraces[i];
        document.querySelector('ti-rov-panel').viewFromGraph(trace.module, trace.view,
                                                             trace.viewArgs);
    },

    getColumnValue : function (viewType, primaryKeyColumnName, primaryKeyColumnValue, columnName, viewData) {
        var val;
        if (viewType == 'INSTANCE') {
            if (rovUtils.isArray(viewData)) {
                for (var i = 0; i < viewData.length; i++) {
                    if (viewData[i][primaryKeyColumnName] == primaryKeyColumnValue) {
                        val = viewData[i][columnName];
                        break;
                    }
                }
            }
            else if (viewData[primaryKeyColumnName] == primaryKeyColumnValue) {
                val = viewData[columnName];
            }
        }
        else if (viewType == 'MODULE') {
            val = viewData[columnName];
        }
        else if (viewType == 'INSTANCE_DATA' || viewType == 'MODULE_DATA') {
            if (rovUtils.isArray(viewData)) {
            }
            else {
                var elemArr = viewData.elements;
                for (var i = 0; i < elemArr.length; i++) {
                    if (elemArr[i][primaryKeyColumnName] == primaryKeyColumnValue) {
                        val = elemArr[i][columnName];
                        break;
                    }
                }
            }
        }
        return (val);
    },

    getSelectedKeyProperties : function (sel) {
        var sepIdx = sel.indexOf(':');
        var props = {key: sel.substr(0, sepIdx), value: sel.substr(sepIdx + 3)};
        props.legendTitle = props.value + ' ' + this.selectedTrace.selectedColumnName;
        return (props);
    },

    /*
     *  ======== getViewCallback ========
     *  Callback from rovData.getView()
     *
     *  Params
     *    error      - null when there is no error; otherwise an error
     *                 message string
     *    viewData   - the ROV view data requested as a JSON object
     *    module     - module name string for the returned view data
     *    view       - view name string for the returned view data
     */
    getViewCallback: function (error, viewData, module, view, handle) {
        /* show the refresh button and hide the refresh spinner */
        if (--this.requests == 0 && this.viewRefresh) {
            this.viewRefresh = false;
        }

        /* handle data acquisition error (if any) */
        if (error != null) {
            return;
        }

        for (var i = 0; i < this.rovTraces.length; i++) {
            var traceView = this.rovTraces[i].args ? this.rovTraces[i].view + this.rovTraces[i].args : this.rovTraces[i].view;
            if (this.rovTraces[i].module == module && traceView == view) {
                this.rovTraces[i].viewData = viewData;
            }
        }
        if (this.requests == 0) {
            var vals = [];
            for (var i = 0; i < this.rovTraces.length; i++) {
                vals.push(Number(this.getColumnValue(this.rovTraces[i].viewType,
                                 this.rovTraces[i].primaryKeyColumnName, this.rovTraces[i].primaryKeyColumnValue,
                                 this.rovTraces[i].selectedColumnName, this.rovTraces[i].viewData)));
            }
            this.plotNewData(vals);
        }
    },

    getViewColumns : function(module, view) {
        var viewObjs = this.viewList[module].viewTabs ? this.viewList[module].viewTabs : this.viewList[module];
        var viewColumns = null;
        for (var i = 0; i < viewObjs.length; i++) {
            if (viewObjs[i].name == view) {
                viewColumns = viewObjs[i].columns;
                break;
            }
        }
        return (viewColumns);
    },

    getViews : function(module) {
        var views = [];
        var viewObjs = this.viewList[module].viewTabs ? this.viewList[module].viewTabs : this.viewList[module];
        if (viewObjs) {
            for (var i = 0; i < viewObjs.length; i++) {
                views.push(viewObjs[i].name);
            }
        }
        return (views);
    },

    getViewType : function(module, view) {
        var viewObjs = this.viewList[module].viewTabs ? this.viewList[module].viewTabs : this.viewList[module];
        var viewType = null;
        for (var i = 0; i < viewObjs.length; i++) {
            if (viewObjs[i].name == view) {
                viewType = viewObjs[i].type;
                break;
            }
        }
        return (viewType);
    },

    graphNameClicked : function (e) {
        var dialog = this.$.graphNameDialog;
        dialog.resetFit();
        var left = e.x;
        if ((left + 225) > document.documentElement.clientWidth) {
            left = document.documentElement.clientWidth - 225;
        }
        dialog.style.left = left + 'px';
        dialog.style.top = e.y + 'px';
        dialog.open();
        dialog.style.zIndex = String(document.querySelector('ti-rov-panel').getMaxZindex() + 1);
        this.$.graphNameInput.value = this.graphName;
    },

    graphNameDialogOkClicked : function (e) {
        this.graphName = this.$.graphNameInput.value;
        this.viewName = this.graphName;
        this.$.graphNameDialog.close();
    },

    isSameModuleView : function (trace1, trace2) {
       return(trace1.module == trace2.module && trace1.view == trace2.view &&
              trace1.args == trace2.args);
    },

    newTrace : function (traceName) {
        var trace = {
            x: [0],
            y: [0],
            type: 'scatter',
            mode: 'lines',
        };
        if (traceName) {
            trace.name = traceName;
        }
        return (trace);
    },

    onPrimaryKeySelected : function (e) {
        if (e.currentTarget.selectedItemLabel) {
            var prevProps = this.getSelectedKeyProperties(this.selectedTrace.dlgPrimaryKey);
            var curProps = this.getSelectedKeyProperties(e.currentTarget.selectedItemLabel);
            if (!this.selectedTrace.dlgAssignedTraceName) {
                if (this.$.assignedTraceNameInput.value != prevProps.legendTitle) {
                    /* user modified legend title */
                    this.selectedTrace.dlgAssignedTraceName = this.$.assignedTraceNameInput.value;
                }
                else {
                    this.$.assignedTraceNameInput.value = curProps.legendTitle;
                }
            }
            this.selectedTrace.dlgPrimaryKey = e.currentTarget.selectedItemLabel;
            this.selectedTrace.dlgLegendTitle = this.$.assignedTraceNameInput.value;
            if (this.$.chartOptionsMenu.selected != undefined) {
                this.$.chartOptionsMenu.selected = -1;
            }
        }
    },

    /*
     *  ======== onRefresh ========
     *  Called when user clicks the 'Refresh' button on this view,
     *  or 'Refresh all' or 'Repeat refresh' buttons on the ROV toolbar
     */
    onRefresh: function () {
        /*
         *  Request CPU load from an ROV view.
         *
         *  This is an asynchronous call; getViewCallback() will be called
         *  with the result in its viewData parameter.
         */
        var requests = [];
        for (var i = 0; i < this.rovTraces.length; i++) {
            var view = this.rovTraces[i].args ? this.rovTraces[i].view + this.rovTraces[i].args : this.rovTraces[i].view;
            if (!requests[this.rovTraces[i].module + '.' + view]) {
                requests[this.rovTraces[i].module + '.' + view] = true;
                if (this.rovData.getView(this.rovTraces[i].module, view, this)) {
                    ++this.requests;
                }
            }
        }
        this.viewRefresh = this.requests > 0;
    },

   /*
    *  ======== onSaveView ========
    *  Called when user clicks the 'Download' button on this view,
    *  or the 'Download all' button on the ROV toolbar
    */
    onSaveView: function () {
        /* return the graph's current data set */
        return (this.rows);
    },

    onTracePropertiesDialogClosed : function (e) {
        if (e.target.id == 'tracePropertiesDialog') {
            this.set('primaryKeyMenuItems', []);
            this.set('primaryKeyMenuLabel', '');
            this.$.primaryKeyMenu._setSelectedItem(null);
        }
    },

    /*
     *  ======== plotNewData ========
     *  Add a new value to the line graph
     */
    plotNewData: function (vals) {
        /* add row to both our data set and the graph's */
        for (var i = 0; i <  vals.length; i++) {
            this.rows[i].x.push(this.sample);
            this.rows[i].y.push(vals[i]);
        }
        ++this.sample;

        /* limit total number of rows */
         for (i = 0; i < this.rows.length; i++) {
            if (this.rows[i].x.length > this.MAX_ROWS) {
                /* remove "oldest" row from our array and the data table */
                this.rows[i].x.splice(0, 1);
                this.rows[i].y.splice(0, 1);
            }
        }

        for (i = 0; i < this.rows.length; i++) {
            this.plJsTraces[i].x = this.rows[i].x;
            this.plJsTraces[i].y = this.rows[i].y;
        }

        if (this.sample > this.VISIBLE_ROWS) {
            /* always show latest data */
            this.layout.xaxis.range = [this.sample - this.VISIBLE_ROWS, this.sample - 1];
        }

        /* compute max and min of y values */
        var min = vals[0];
        var max = vals[0];
        for (var i = 1; i <  vals.length; i++) {
            if (vals[i] < min) {
                min = vals[i];
            }
            if (vals[i] > max) {
                max = vals[i];
            }
        }

        var setYRange = false;
        if (this.rows[0].y.length == 1) {
            this.maxValue = max;
            this.minValue = min;
            setYRange = true;
        }
        else {
            /* reset yaxis range, if necessary */
            if (max > this.maxValue) {
                this.maxValue = max;
                setYRange = true;
            }
            else if (min < this.minValue) {
                this.minValue = min;
                setYRange = true;
            }
        }
        if (setYRange) {
            this.layout.yaxis.range = [Math.floor(this.minValue - (this.minValue * .1)),
                                       Math.ceil(this.maxValue + (this.maxValue * .1))];
            this.layout.xaxis.showline = true;
            this.layout.yaxis.showline = true;
        }

        /* update graph's x-axis (if necessary) and redraw it */
        Plotly.update(this.$.graph, this.plJsTraces, this.layout);
    },

    plotOptionsDialog : function (event) {
        if (!this.selectedTrace.args && this.selectedTrace.viewType != 'MODULE') {
            this.primaryKeySectionHidden = false;
            var primaryKeyMenuItems = [];
            var primaryKeyColumns = this.selectedTrace.primaryKeyColumns;
            var maxStr = '';
            var pKeyIndex = 0;
            for (var i = 0; i < primaryKeyColumns.length; i++) {
                var val = this.getColumnValue(this.selectedTrace.viewType,
                                              this.selectedTrace.primaryKeyColumnName, this.selectedTrace.primaryKeyColumnValue,
                                              primaryKeyColumns[i], this.selectedTrace.viewData);
                primaryKeyMenuItems.push(primaryKeyColumns[i] + ':  ' + val);
                if (primaryKeyColumns[i] == this.selectedTrace.primaryKeyColumnName) {
                    pKeyIndex = i;
                }
                if (primaryKeyMenuItems[i].length > maxStr.length) {
                    maxStr = primaryKeyMenuItems[i];
                }
            }

            this.set('primaryKeyMenuItems', primaryKeyMenuItems);
            this.set('primaryKeyMenuLabel', this.selectedTrace.primaryKeyColumnName + ':  ' +  this.selectedTrace.primaryKeyColumnValue);
        }
        else {
            this.primaryKeySectionHidden = true;
        }
        this.$.assignedTraceNameInput.value = event.currentTarget.innerText.trim();

        /* stuff to maintain state of tracePropertiesDialog */
        if (!this.selectedTrace.args && this.selectedTrace.viewType != 'MODULE') {
            this.selectedTrace.dlgPrimaryKey = this.primaryKeyMenuLabel;
        }
        this.selectedTrace.dlgAssignedTraceName = this.selectedTrace.assignedTraceName;

        /* for margins, checkbox and droplists */
        var width = rovUtils.getStringWidth(maxStr);
        this.$.primaryKeyMenu.$.menuButton.style.width = width + 'px';

        var left = event.x;
        if ((left + width + 100) > document.documentElement.clientWidth) {
            left -= (width + 100);
        }
        var dialog = this.$.tracePropertiesDialog;
        dialog.resetFit();
        dialog.style.left = left + 'px';
        dialog.style.top = event.y + 'px';
        dialog.open();
        dialog.style.zIndex = String(document.querySelector('ti-rov-panel').getMaxZindex() + 1);
        if (this.$.chartOptionsMenu.selected != undefined) {
            this.$.chartOptionsMenu.selected = -1;
        }
    },

    /*
     *  ======== resized ========
     *  Callback initially passed to rovUtils.initRovResize() from
     *  resizerClicked(). Called after the view has been resized,
     *  enabling us to resize the graph accordingly
     */
    resized: function () {
        /* get viewPaperCard defined via the element in ti-rov-graph.html */
        var viewPaperCard = this.$.viewPaperCard;
        var graph = this.$.graph;

        /* get the new width and height from viewPaperCard's style */
        var width = Number(viewPaperCard.style.width.slice(0, -2));
        var height = Number(viewPaperCard.style.height.slice(0, -2));

        /* get viewPaperCard minWidth and minHeight */
        var minWidth = Number(viewPaperCard.style.minWidth.slice(0, -2));
        var minHeight = Number(viewPaperCard.style.minHeight.slice(0, -2));

        /* Don't let new size go below the defined minimums */
        this.graphWidth = Math.max(width, minWidth) * .95;
        this.graphHeight = Math.max(height, minHeight) * .85;

        /* Scale the graph accordingly */
        graph.style.width = this.graphWidth + 'px';
        graph.style.height = this.graphHeight + 'px';

        /* update the graph and redisply it */
        this.layout.width = this.graphWidth;
        this.layout.height = this.graphHeight;
        this.VISIBLE_ROWS = Math.floor((this.graphWidth - 80) / 3.1) + 1;
        if (this.VISIBLE_ROWS > this.MAX_ROWS) {
            this.VISIBLE_ROWS = this.MAX_ROWS;
        }
        if (this.sample.length > this.VISIBLE_ROWS) {
            /* always show latest data */
            this.layout.xaxis.range = [this.sample - this.VISIBLE_ROWS, this.sample - 1];
        }
        else {
            this.layout.xaxis.range = [0, this.VISIBLE_ROWS - 1];
        }
        Plotly.update(this.$.graph, this.plJsTraces, this.layout);
    },

    /*
     *  ======== resizerClicked ========
     *  Called on a bottom corner on-mousedown event
     *
     *  See ti-rov-graph.html resizer div.
     */
    resizerClicked: function (e) {
        /*
         *  call polymerUI/src/rovUtils.js initRovResize(), passing the
         *  viewPaperCard element that is being resized. Also pass callback
         *  object in order to be notified via this.resized() when the element
         *  is done being is resized, so we can make any required size related
         *  changes to the graph itself
         */
        rovUtils.initRovResize(e, this.$.viewPaperCard, {elem: this, fxn: this.resized});
    },

    rovGraphDialogKeyPress : function (e) {
        var keyCode = e.keyCode || e.which;
        if (keyCode === 13) {
            var dlgId = e.currentTarget.id;
            this[dlgId + 'OkClicked'](e);
        }
    },

    setAxisLabels : function (labelsObj) {
        if (labelsObj.xAxisLabel) {
            this.xAxisLabel = labelsObj.xAxisLabel;
            this.layout.xaxis.title = this.xAxisLabel;
        }
        if (labelsObj.yAxisLabel) {
            this.yAxisLabel = labelsObj.yAxisLabel;
            this.layout.yaxis.title = this.yAxisLabel;
        }
        Plotly.update(this.$.graph, this.plJsTraces, this.layout);
    },

    traceName : function (trace) {
        var name;
        if (trace.assignedTraceName) {
            name = trace.assignedTraceName;
        }
        else if (trace.args) {
            name = trace.firstArg;
        }
        else if (trace.viewType == 'MODULE') {
            name = trace.selectedColumnName;
        }
        else {
            var name = trace.primaryKeyColumnValue + '<br>' + trace.selectedColumnName;
        }
        return (name);
    },

    traceNameMenuItemSelected : function (e) {
        this.$.traceNamesMenu.selected = -1;
        if (e.srcElement.id != 'icon') {  /* delete trace button */
            var idElem = e.currentTarget.lastElementChild;
            var i = Number(idElem.id.substr(idElem.id.indexOf('_') + 1));
            this.set('selectedTrace', this.rovTraces[i]);
            this.selectedTrace.index = i;
            this.plotOptionsDialog(e);
        }
    },

    tracePropertiesDialogOkClicked : function (e) {
        var keyChanged = false;
        var legendChanged = false;
        var update = false;
        if (!this.selectedTrace.args && this.selectedTrace.viewType != 'MODULE') {
            var label = this.$.primaryKeyMenu.selectedItemLabel ?
                        this.$.primaryKeyMenu.selectedItemLabel :
                        this.$.primaryKeyMenu.label;
            var props = this.getSelectedKeyProperties(label);
            if (this.selectedTrace.primaryKeyColumnName != props.key) {
                this.selectedTrace.primaryKeyColumnName = props.key;
                this.selectedTrace.primaryKeyColumnValue = props.value;
                keyChanged = true;
            }
            if (this.$.assignedTraceNameInput.value != props.legendTitle) {
                if (this.selectedTrace.assignedTraceName != this.$.assignedTraceNameInput.value) {
                    this.selectedTrace.assignedTraceName = this.$.assignedTraceNameInput.value
                    legendChanged = true;
                }
            }
            else if (this.selectedTrace.assignedTraceName) {
                this.selectedTrace.assignedTraceName = null;
                legendChanged = true;
            }
        }
        else {
            var defaultName = this.selectedTrace.args ? this.selectedTrace.firstArg : this.selectedTrace.selectedColumnName;
            if (this.$.assignedTraceNameInput.value != defaultName) {
                if (this.selectedTrace.assignedTraceName != this.$.assignedTraceNameInput.value) {
                    this.selectedTrace.assignedTraceName = this.$.assignedTraceNameInput.value
                    legendChanged = true;
                }
            }
            else if (this.selectedTrace.assignedTraceName) {
                this.selectedTrace.assignedTraceName = null;
                legendChanged = true;
            }
        }
        if (keyChanged && !legendChanged && !this.selectedTrace.assignedTraceName) {
            this.plJsTraces[this.selectedTrace.index].name = this.selectedTrace.primaryKeyColumnValue + '<br>' + this.selectedTrace.selectedColumnName;
            update = true;
        }
        else if (legendChanged) {
            this.plJsTraces[this.selectedTrace.index].name = this.traceName(this.selectedTrace);
            update = true;
        }
        if (update) {
            var traceNameMenuItems = [];
            this.set('traceNamesMenuItems.' + this.selectedTrace.index + '.label',
                     this.plJsTraces[this.selectedTrace.index].name.replace(/<br>/, ' '));
            this.$.traceNamesMenuTemplate.render();
            Plotly.update(this.$.graph, this.plJsTraces, this.layout);
        }

        /* error check legend title ? */
        this.$.tracePropertiesDialog.close();
    }
});
