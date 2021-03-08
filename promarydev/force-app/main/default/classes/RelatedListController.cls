public class RelatedListController {

    PUBLIC CLASS  fieldWrapper{
        public String label {get;set;} 
        public String fieldName {get;set;} 
        public Schema.DisplayType type {get;set;} // in json: type
        public String sortable {get;set;} 
        public TypeAttributes typeAttributes {get;set;}
        
        public fieldWrapper(){
            
        }
        public fieldWrapper(String label, String fieldName,Schema.DisplayType type){
            this.label = label;
            this.fieldName = fieldName;
            this.type = type;
        }
    }
    
    
    public class TypeAttributes {
        public String year {get;set;} 
        public String month {get;set;} 
        public String day {get;set;} 
        public String hour {get;set;} 
        public String minute {get;set;} 
        public String second {get;set;} 
        
        
    }
	
    public static void  readField(){
        list<fieldWrapper> lfw = new list<fieldWrapper>();
         List<Schema.FieldSetMember> fieldSetMemberList =  readFieldSet('Account_FieldSet','Account');
for(Schema.FieldSetMember fieldSetMemberObj : fieldSetMemberList)
{
    system.debug('API Name ====>' + fieldSetMemberObj.getFieldPath()); //api name
    system.debug('Label ====>' + fieldSetMemberObj.getLabel());
    system.debug('Required ====>' + fieldSetMemberObj.getRequired());
    system.debug('DbRequired ====>' + fieldSetMemberObj.getDbRequired());
    system.debug('Type ====>' + fieldSetMemberObj.getType());   //type - STRING,PICKLIST
    lfw.add(
            new fieldWrapper(
                                fieldSetMemberObj.getLabel(),
                                     fieldSetMemberObj.getFieldPath(),
                                     fieldSetMemberObj.getType()
            )
    );
    
}
    }
	
    public  static void buildQuery(String ObjectName,String fieldSetName,String whereClause,String orderby,String direction,String limitby){
        
       
        
    }
    
    public static List<Schema.FieldSetMember> readFieldSet(String fieldSetName, String ObjectName)
{
    Map<String, Schema.SObjectType> GlobalDescribeMap = Schema.getGlobalDescribe(); 
    Schema.SObjectType SObjectTypeObj = GlobalDescribeMap.get(ObjectName);
    Schema.DescribeSObjectResult DescribeSObjectResultObj = SObjectTypeObj.getDescribe();

    //system.debug('====>' + DescribeSObjectResultObj.FieldSets.getMap().get(fieldSetName));

    Schema.FieldSet fieldSetObj = DescribeSObjectResultObj.FieldSets.getMap().get(fieldSetName);

    //List<Schema.FieldSetMember> fieldSetMemberList =  fieldSetObj.getFields();
    //system.debug('fieldSetMemberList ====>' + fieldSetMemberList);  
    return fieldSetObj.getFields(); 
}  
}