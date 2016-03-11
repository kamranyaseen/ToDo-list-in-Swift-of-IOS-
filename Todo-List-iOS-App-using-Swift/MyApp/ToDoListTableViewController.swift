import UIKit



@objc(ToDoListTableViewController) class ToDoListTableViewController: UITableViewController {

    @IBAction func unwindToList(segue:UIStoryboardSegue){
        let source: AddToDoViewController = segue.sourceViewController as! AddToDoViewController
        if let item: ToDoItem = source.toDoItem{
            self.toDoItems.addObject(item)
            self.tableView.reloadData()
        }
        
    }
    
    var toDoItems: NSMutableArray = []
   
    
    override func viewDidLoad(){
        super.viewDidLoad()
        loadInitialData()
    }
    
    func loadInitialData(){
        let item1 = ToDoItem(name:"Check Emails")
        self.toDoItems.addObject(item1)
        let item2 = ToDoItem(name: "Schedule Tasks")
        self.toDoItems.addObject(item2)
        let item3 = ToDoItem(name: "Debug todo App")
        self.toDoItems.addObject(item3)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.toDoItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CellIndentifier: NSString = "ListPrototypeCell"
        
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(CellIndentifier as String) as UITableViewCell!
        
        let todoitem: ToDoItem = self.toDoItems.objectAtIndex(indexPath.row) as! ToDoItem
        
        cell.textLabel?.text = todoitem.itemName as String
        
        if todoitem.completed{
            
            cell.accessoryType = .Checkmark
            
        }
            
        else{
            
            cell.accessoryType = .None
            
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        let tappedItem: ToDoItem = self.toDoItems.objectAtIndex(indexPath.row) as! ToDoItem
        tappedItem.completed = !tappedItem.completed
        tableView.reloadData()
        
    }
}









