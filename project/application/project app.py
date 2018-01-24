import wx
import gettext
import cx_Oracle
import os

connection = cx_Oracle.connect("system", "password","localhost")
cursor = connection.cursor()

#will map attributes to primary keys
# none for year since it comes from car
makeP = {}
modelP = {}
typeP = {}
trimP = {}
colorP = {}

def genYear():
    cursor.execute("SELECT UNIQUE year FROM car")
    ret = []
    tmp = cursor.fetchall()
    for x in tmp:
        ret.append(str(x[0]))
    return ret

def genMake():
    cursor.execute("SELECT make_n,make_id FROM make")
    ret = []
    tmp = cursor.fetchall()
    for x in tmp:
        ret.append(str(x[0]))
        makeP[str(x[0])] = x[1]
    return ret

def genModel():
    cursor.execute("SELECT model_n,model_id FROM model")
    ret = []
    tmp = cursor.fetchall()
    for x in tmp:
        ret.append(str(x[0]))
        modelP[str(x[0])] = x[1]
    return ret

def genType():
    cursor.execute("SELECT type_n,type_id FROM type")
    ret = []
    tmp = cursor.fetchall()
    for x in tmp:
        ret.append(str(x[0]))
        typeP[str(x[0])] = x[1]
    return ret

def genTrim():
    cursor.execute("SELECT trim_n,trim_id FROM trim")
    ret = []
    tmp = cursor.fetchall()
    for x in tmp:
        ret.append(str(x[0]))
        trimP[str(x[0])] = x[1]
    return ret

def genColor():
    cursor.execute("SELECT color_n,color_id FROM color")
    ret = []
    tmp = cursor.fetchall()
    for x in tmp:
        ret.append(str(x[0]))
        colorP[str(x[0])] = x[1]
    return ret

class MyFrame(wx.Frame):
    selection = {}

    def __init__(self, *args, **kwds):
        
        kwds["style"] = wx.DEFAULT_FRAME_STYLE
        wx.Frame.__init__(self, *args, **kwds)
        self.label_1 = wx.StaticText(self, wx.ID_ANY, _("Year"))
        self.choice_year = wx.Choice(self, wx.ID_ANY, choices=genYear())
        self.label_2 = wx.StaticText(self, wx.ID_ANY, _("Make"))
        self.choice_make = wx.Choice(self, wx.ID_ANY, choices=genMake())
        self.label_3 = wx.StaticText(self, wx.ID_ANY, _("Model"))
        self.choice_model = wx.Choice(self, wx.ID_ANY, choices=genModel())
        self.label_4 = wx.StaticText(self, wx.ID_ANY, _("Type"))
        self.choice_type = wx.Choice(self, wx.ID_ANY, choices=genType())
        self.label_5 = wx.StaticText(self, wx.ID_ANY, _("Trim"))
        self.choice_trim = wx.Choice(self, wx.ID_ANY, choices=genTrim())
        self.label_6 = wx.StaticText(self, wx.ID_ANY, _("Color"))
        self.choice_color = wx.Choice(self, wx.ID_ANY, choices=genColor())
        self.results = wx.ListCtrl(self, wx.ID_ANY, style=wx.LC_REPORT | wx.SUNKEN_BORDER)

        self.results.InsertColumn(0, 'Year')
        self.results.InsertColumn(1, 'Make')
        self.results.InsertColumn(2, 'Model')
        self.results.InsertColumn(3, 'Type')
        self.results.InsertColumn(4, 'Trim')
        self.results.InsertColumn(5, 'Color')
        self.results.InsertColumn(6, 'Front')
        self.results.InsertColumn(7, 'Location')

        self.__set_properties()
        self.__do_layout()

        self.Bind(wx.EVT_CHOICE, self.year_event, self.choice_year)
        self.Bind(wx.EVT_CHOICE, self.make_event, self.choice_make)
        self.Bind(wx.EVT_CHOICE, self.model_event, self.choice_model)
        self.Bind(wx.EVT_CHOICE, self.type_event, self.choice_type)
        self.Bind(wx.EVT_CHOICE, self.trim_event, self.choice_trim)
        self.Bind(wx.EVT_CHOICE, self.color_event, self.choice_color)
        self.Bind(wx.EVT_LIST_ITEM_ACTIVATED, self.pic_selection_event, self.results)


    def __set_properties(self):
        self.SetTitle(_("DB App"))

    def refresh(self):
        index = 0
        std_q = """SELECT ca.year, mk.make_n, m.model_n, ty.type_n, tr.trim_n, co.color_n, p.front, p.loc
        FROM car ca, make mk, model m, type ty, trim tr, color co, picture p
        WHERE ca.make_id = mk.make_id AND ca.model_id = m.model_id AND
        ca.trim_id = tr.trim_id AND ca.type_id = ty.type_id AND
        p.color_id = co.color_id AND p.car_id = ca.car_id
        """

        for key in self.selection.keys():
            if key == 'year':
                std_q += "AND ca.year = %d" % self.selection[key]
            elif key == 'make':
                std_q += "AND ca.make_id = %d" % self.selection[key]
            elif key == 'model':
                std_q += "AND ca.model_id = %d" % self.selection[key]
            elif key == 'type':
                std_q += "AND ca.type_id = %d" % self.selection[key]
            elif key == 'trim':
                std_q += "AND ca.trim_id = %d" % self.selection[key]
            elif key == 'color':
                std_q += "AND p.color_id = %d" % self.selection[key]

        cursor.execute(std_q)
        res = cursor.fetchall()
        self.results.DeleteAllItems()
        
        for x in res:
            #print x
            self.results.InsertStringItem(index, str(index))
            self.results.SetStringItem(index, 0, str(x[0]))
            self.results.SetStringItem(index, 1, x[1])
            self.results.SetStringItem(index, 2, x[2])
            self.results.SetStringItem(index, 3, x[3])
            self.results.SetStringItem(index, 4, x[4])
            self.results.SetStringItem(index, 5, x[5])
            self.results.SetStringItem(index, 6, x[6])
            self.results.SetStringItem(index, 7, x[7])
            index += 1




    def __do_layout(self):
        sizer_1 = wx.BoxSizer(wx.VERTICAL)
        grid_sizer_1 = wx.GridSizer(2, 6, 0, 0)
        grid_sizer_1.Add(self.label_1, 0, 0, 0)
        grid_sizer_1.Add(self.choice_year, 0, 0, 0)
        grid_sizer_1.Add(self.label_2, 0, 0, 0)
        grid_sizer_1.Add(self.choice_make, 0, 0, 0)
        grid_sizer_1.Add(self.label_3, 0, 0, 0)
        grid_sizer_1.Add(self.choice_model, 0, 0, 0)
        grid_sizer_1.Add(self.label_4, 0, 0, 0)
        grid_sizer_1.Add(self.choice_type, 0, 0, 0)
        grid_sizer_1.Add(self.label_5, 0, 0, 0)
        grid_sizer_1.Add(self.choice_trim, 0, 0, 0)
        grid_sizer_1.Add(self.label_6, 0, 0, 0)
        grid_sizer_1.Add(self.choice_color, 0, 0, 0)
        sizer_1.Add(grid_sizer_1, 1, wx.EXPAND, 0)
        sizer_1.Add(self.results, 1, wx.EXPAND, 0)
        self.SetSizer(sizer_1)
        sizer_1.Fit(self)
        self.Layout()

    def year_event(self, event):  #  MyFrame.<event_handler>
        print  "Slelection: " + self.choice_year.GetString(self.choice_year.GetSelection())
        self.selection['year'] = int(self.choice_year.GetString(self.choice_year.GetSelection()))
        self.refresh()
        #event.Skip()

    def make_event(self, event):  #  MyFrame.<event_handler>
       self.selection['make'] = makeP[self.choice_make.GetString(self.choice_make.GetSelection())]
       self.refresh()

    def model_event(self, event):  #  MyFrame.<event_handler>
        self.selection['model'] = modelP[self.choice_model.GetString(self.choice_model.GetSelection())]
        self.refresh()

    def type_event(self, event):  #  MyFrame.<event_handler>
        self.selection['type'] = typeP[self.choice_type.GetString(self.choice_type.GetSelection())]
        self.refresh()

    def trim_event(self, event):  #  MyFrame.<event_handler>
        self.selection['trim'] = trimP[self.choice_trim.GetString(self.choice_trim.GetSelection())]
        self.refresh()

    def color_event(self, event):  #  MyFrame.<event_handler>
        self.selection['color'] = colorP[self.choice_color.GetString(self.choice_color.GetSelection())]
        self.refresh()

    def pic_selection_event(self, event):  #  MyFrame.<event_handler>
        curitem = event.m_itemIndex
        litem = self.results.GetItem(curitem,7).GetText()
        os.startfile(litem)

# end of class MyFrame
if __name__ == "__main__":
    gettext.install("app") # replace with the appropriate catalog name

    app = wx.PySimpleApp(0)
    wx.InitAllImageHandlers()
    frame_1 = MyFrame(None, wx.ID_ANY, "")
    app.SetTopWindow(frame_1)
    frame_1.Show()
    frame_1.refresh()
    app.MainLoop()
