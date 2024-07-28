
ui = fu.UIManager
disp = bmd.UIDispatcher(ui)

-- Define window elements
win = disp:AddWindow({
    ID = "MyWin",
    WindowTitle = "To-Do List",
    Geometry = {100, 100, 700, 600},
    
    ui:VGroup{
        ID = "root",
        ui:Button{  Weight=0.1, ID="Node_helper" , Text="Node Helper",Flat=true,StyleSheet =
        "background-color:#212121;border:1px blue;font-Weight :bold;font-size: 22px;", }
  ,
        ui:HGroup{ 



        ui:Tree{Weight=0.4,ID = "category", Headers = {"Tasks"} , Indentation = 0.0, Events = { ItemDoubleClicked = true, ItemClicked = true }, StyleSheet =
        "background-color:#212121;border:1px blue;", },
        ui:VGroup{
Weight=0.4,
            ui:Tree{ ID = "nodes_list",  Indentation = 0.0, Events = { ItemDoubleClicked = true, ItemClicked = true }, StyleSheet =
            "background-color:#212121;border:1px blue;", },
            ui:LineEdit{Weight=0.1, ID="Search"}
        },
        ui:VGroup{
            ui:Button{  Weight=0.1, ID="Description_t" , Text="Description",Flat=true,StyleSheet =
            "background-color:#212121;border:1px blue;font-Weight :bold;font-size: 15px;", },
        ui:TextEdit{ID = "Description"},
        ui:Button{  Weight=0.1, ID="Example" , Text="Example",Flat=true,StyleSheet =
        "background-color:#212121;border:1px blue;font-Weight :bold;font-size: 15px;", }
        -- ui:LineEdit{  Weight=0.1,    ID="ae_search"}

    },

    }


      
    },
})

item = win:GetItems()







item.category:Clear()
hdr = item.category:NewItem()
hdr.Text[0] = "Category"
hdr.Font[0] = ui:Font { PixelSize = 16, }
hdr.TextColor[0] = { R = 0, G = 0, B = 0, A = 1 }
hdr.BackgroundColor[0] = { R = 20, G = 20, B = 1, A = 1 }
item.category:SetHeaderItem(hdr)

                itRow = item.category:NewItem();
                itRow.Text[0] = "2D"
            
                item.category:AddTopLevelItem(itRow)



                itRow = item.category:NewItem();
                itRow.Text[0] = "3D"
            
                item.category:AddTopLevelItem(itRow)







    item.nodes_list:Clear()
    hdr = item.nodes_list:NewItem()
    hdr.Text[0] = "Nodes"
    hdr.Font[0] = ui:Font { PixelSize = 16, }
    hdr.TextColor[0] = { R = 0, G = 0, B = 0, A = 1 }
    hdr.BackgroundColor[0] = { R = 20, G = 20, B = 1, A = 1 }
    item.nodes_list:SetHeaderItem(hdr)


function two_d()





    
                    itRow = item.nodes_list:NewItem();
                    itRow.Text[0] = "Background"
                    item.nodes_list:AddTopLevelItem(itRow)
    
    




    
end







function three_d()




    
                    itRow = item.nodes_list:NewItem();
                    itRow.Text[0] = "3D camera"
                    item.nodes_list:AddTopLevelItem(itRow)
    
    




    
end













function win.On.nodes_list.ItemClicked(ev)
    
if ev.item.Text[0]=="Background" then 


    item.Description.Text = "Background is a genarator"

elseif ev.item.Text[0]=="3D camera" then 

   item.Description.Text = "3D is a genarator"
else
    
end


end






function win.On.category.ItemClicked(ev)
    
    if ev.item.Text[0]=="2D" then 
    
    two_d()
    elseif ev.item.Text[0]=="3D"  then
three_d()
    else


    
    end
    
    
    end
    
    






function win.On.MyWin.Close(ev)
    disp:ExitLoop()

end

win:Show()
disp:RunLoop()
win:Hide(); 
