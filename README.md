# EquipDistributionMS ����Щ��:smirk:ʺ��������Ŀӡ�
ʺ����ı�ҵ���-�����豸�ֲ�����ϵͳ   

## :blush: 2017��2��25���������¹�����
+ spring3.x��֧��Java1.8,����spring4.x
+ commons-lang-xx��commons-lang3-xx ����Ŀ�����õ���Jar������ǰ�ߣ�����Ҫ��StringUtils���ٵ����Lang3-xx.
+ ��Ŀ�����Ͽ���trying to resolve system-id[..dtd:hibernate3.0mapping.. �����͵������ֱ��� ������Ϊ������hibernate��������dtd�ļ��ˣ�����ѡ���ڱ������á�����ѹ������ʽ��hibernate3.jar �����ҵ�hibernate-mapping-3.0���ο����ӣ�http://blog.csdn.net/huweijian5/article/details/21863161
+ <result type="json"></result>������Ҫstruts-json-plugin.jar����json-lib.jar(�������Ҳ���ϰ�)���ǵð����̳� Json-default!

## :blush: 2017��3��2���������¹�����
+ struts��servlet����ʱ���Ұ�Struts ���˴�/*��Ϊ*.action,����ʹ��servlet�������ȱ����ص�����

## :blush: 2017��3��18���������¹�����
+ getCurrentSession�� openSession����
+ ��Field 'CARD_ID' doesn't have a default value��mysqlע��������Ϊ�Զ��������Ұ�decimal�ĳ�bigint��ok.

## :blush: 2017��3��25���������¹�����
+ ��һ���ܿӵĵͼ��� ����datagrid�жϻ�ȡ����ʱ����ǰҳ�����ѡ������ˢ�����ݾͻ��֮ǰ���ϵ������ۼӡ� idField="specId"������ֶΡ�
+ �޸����м�¼��mysql���ݱ������Ϊ�Զ�����ʱ,�������´���
��ALTER TABLE causes auto_increment resequencing, resulting in duplicate entry ��1�� for key ��PRIMARY����
 ```  
 ��1�����������ֶ�ֵΪ0��������¼ֵ��Ϊ��������0�Ҳ��ظ���������
 ��2�����޸������ֶ�Ϊauto_increment
��3�����Ѹղ��޸Ĺ���������¼��ֵ��ԭ
 ``` 
 
## :blush: 2017��3��28���������¹�����
+ �޸�mysql������id

![image](https://github.com/WuqingVika/EquipDistributionMS/blob/master/WebRoot/img/helpOne.jpg)

+ ɾ��sqlδִ��
�ǵü���.executeUpdate();

## :blush: 2017��4��9���������¹�����
+ easyui��ѡ��ˢ���ۼ�����
```  
 //datagrid����idField,����google easyui idField����;
 $('#dg').datagrid('clearSelections');//ÿ�μ���datagrid��Ҫ���
 ԭ�Ĳο���http://blog.csdn.net/isea533/article/details/50929752
 ``` 
+ �����ʼ���֤����Ȩ������
```  
 MailUtil�е�return new PasswordAuthentication("aa@qq.com", "abcxxxxxxxxxx"); // �����������˺š���Ȩ��
	//ע����Ȩ�벻���������룬���Կ���λ�ȡ��Ȩ�룬����ճ����Ok.			
 ``` 
 
## :blush: 2017��4��12���������¹�����
+ struts�ض�������
```
	window.location.href='';//�����ĳ�top.location.href;
	�Ҿ��ǰ��������̫������,��������ô��ӣ������侲�����ú���Ͼ� ��䲻�����ڡ�
	
 ``` 
---

## ϵͳ��ͼ 
+ 1��¼����
![image](https://github.com/WuqingVika/EquipDistributionMS/blob/master/WebRoot/img/showLogin.jpg)
+ 2ϵͳ��ҳ��
![image](https://github.com/WuqingVika/EquipDistributionMS/blob/master/WebRoot/img/showMain.jpg)
+ 3�������ҳ��
![image](https://github.com/WuqingVika/EquipDistributionMS/blob/master/WebRoot/img/showCabinet.jpg)
+ 4�豸����ҳ��
![image](https://github.com/WuqingVika/EquipDistributionMS/blob/master/WebRoot/img/showEqu.jpg)
+ 5�忨����ҳ��
![image](https://github.com/WuqingVika/EquipDistributionMS/blob/master/WebRoot/img/showCard.jpg)
+ 6רҵ����ҳ��
![image](https://github.com/WuqingVika/EquipDistributionMS/blob/master/WebRoot/img/showSpec.jpg)
+ 7��վ����ҳ��
![image](https://github.com/WuqingVika/EquipDistributionMS/blob/master/WebRoot/img/showRegion.jpg)
+ 8��������ҳ��
![image](https://github.com/WuqingVika/EquipDistributionMS/blob/master/WebRoot/img/comroomManage.png)
+ 9�û�����ҳ��
![image](https://github.com/WuqingVika/EquipDistributionMS/blob/master/WebRoot/img/showUser.png)
+ 10��������ҳ��
![image](https://github.com/WuqingVika/EquipDistributionMS/blob/master/WebRoot/img/showsendEmail.png)
---
�����ܻ���ƴ�������У�:blush:��