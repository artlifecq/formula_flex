package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.manager.fight.FightValueUtil;
	import com.rpgGame.app.manager.goods.RoleEquipmentManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import app.message.EquipType;
	
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	
	import org.client.mainCore.ds.HashMap;
	import org.mokylin.skin.app.tips.zhuangbeiTips_Skin;
	
	public class EquipTipItem extends SkinUI
	{
		private var _skin:zhuangbeiTips_Skin;
		private var _iconFace:IconCDFace;
		private var labelList:Vector.<Label>;
		private var lines:Vector.<UIAsset>;
		private var yinIcon:UIAsset;
		private var _itemInfo:ClientItemInfo;

		private var curY:int;

		private var map1:HashMap;

		private var ids:Array;
		
		public function EquipTipItem(skin:StateSkin=null)
		{
			_skin=new zhuangbeiTips_Skin();
			super(_skin);
			initTip();
		}
		/**
		 * 初始化 
		 * 
		 */		
		private function initTip():void
		{
			//装备格子
			_iconFace=new IconCDFace(IcoSizeEnum.ICON_64);
			_iconFace.alwayShowCount=false;
			addChild(_iconFace);
			_iconFace.x=5;
			_iconFace.y=35;
			_skin.container.addChild(_iconFace);
			labelList=new Vector.<Label>();
			lines=new Vector.<UIAsset>();
			yinIcon=new UIAsset();
			yinIcon.styleName="ui/common/tubiao/yinzi_24.png";
		}
		
		/**
		 *显示基本信息 
		 * @param data
		 * 
		 */
		public function showBaseTips(data:ClientItemInfo):void
		{
			_itemInfo = data as ClientItemInfo;
			FaceUtil.SetItemGrid(_iconFace, _itemInfo, false);
			_iconFace.setQualityImageIconPoint(8,7);
			var info:HeroData=MainRoleManager.actorInfo;
			while(labelList.length!=0){
				var l:Label=labelList.shift();
				l.removeFromParent(true);
			}
			while(lines.length!=0){
				var line:UIAsset=lines.shift();
				line.removeFromParent(true);
			}
			_skin.lbl_titile.text=_itemInfo.qItem.q_name;
			var equipItemInfo:ClientItemInfo=RoleEquipmentManager.instance.getEquipInfoByIndex(_itemInfo.qItem.q_kind);//根据佩戴部位获取已经装备的装备信息
			var equipFight:Number=FightValueUtil.getFightValueByEquip(_itemInfo);
			var currentFight:int=0;
			_skin.numbers.number=equipFight;
			_skin.tip_down.visible=false;
			_skin.tip_up.visible=false;
			if(equipItemInfo){
				currentFight=FightValueUtil.getFightValueByEquip(equipItemInfo);
			}
			
			_skin.isLock.visible=true;
			if(_itemInfo.binded){
				_skin.isLock.text="[已绑定]"
			}else{
				if(_itemInfo.qItem.q_bind==0){
					_skin.isLock.visible=false;
				}else if(_itemInfo.qItem.q_bind==1){
					_skin.isLock.visible="[获得时绑定]";
				}else{
					_skin.isLock.visible="[使用后绑定]";
				}
			}
			
			if(_itemInfo.qItem.q_level==0){
				name=HtmlTextUtil.getTextColor(0xCFC6AE,"无限制");
			}else if(info.totalStat.level>=_itemInfo.qItem.q_level){
				name=HtmlTextUtil.getTextColor(0xCFC6AE,_itemInfo.qItem.q_level+"级");
			}else{
				name=HtmlTextUtil.getTextColor(0xE1201C,_itemInfo.qItem.q_level+"级");
			}
			_skin.lbl_xuqiu.htmlText=name;
			_skin.lbl_zhiye.text=getJobName(_itemInfo.qItem.q_job);
			_skin.lbl_pingzhi.text=getLevele(_itemInfo.qItem.q_levelnum);
			_skin.lbl_buwei.text=EquipType.EquipNames[_itemInfo.qItem.q_kind];
			
			if(_itemInfo.qItem.q_max_strengthen!=0){
				_skin.lbl_qianghuatitle.visible=true;
				_skin.lbl_qianghua.visible=_itemInfo.qItem.q_max_strengthen.toString();
			}else{
				_skin.lbl_qianghuatitle.visible=false;
				_skin.lbl_qianghua.visible=false;
			}
			
			createLine(10,160,260);
			
			for(var i:int=0;i<_skin.zhuangbei_bg.numChildren;i++){
				_skin.zhuangbei_bg.getChildAt(i).visible=false;
			}
			_skin.zhuangbei_bg.getChildAt(_itemInfo.qItem.q_default-1).visible=true;
			
			var name:String;
			var value:String;
			var attValues1:Q_att_values=AttValueConfig.getAttInfoById(int(_itemInfo.qItem.q_att_type));
			if(!attValues1){
				return ;
			}
			map1=new HashMap();
			
			var label:Label;
			curY=170;
			var num:int=0;
			for(i=1;i<CharAttributeType.TYPE_NUM;i++){
				if(attValues1["q_value"+i]!=0){
					map1.add(attValues1["q_type"+i],attValues1["q_value"+i]);
				}
			}
			ids=CharAttributeType.baseAttrIdArr;
			name=HtmlTextUtil.getTextColor(0xCFC6AE,"[基础属性]\n");
			label=createLabel(name,"");
			label.x=10;
			label.y=curY;
			var id:int;
			var per:String="";
			for each(id in ids){
				var v:int=map1.getValue(id);
				if(v==0){
					continue;
				}
				curY+=25;
				
				num++;
				name=CharAttributeType.getCNName(id);
				if(name.indexOf("率")!=-1||name.indexOf("百分比")!=-1){
					per="%"
				}else{
					per="";
				}
				name=HtmlTextUtil.getTextColor(0x8B8D7B,name+":");
				value=HtmlTextUtil.getTextColor(0xCFC6AE,v+per);
				label=createLabel(name,value);
				//				if(num%2!=0){
				label.x=10;
				//				}else{
				//					label.x=155;
				//				}
				label.y=curY;
			}
			
			//琢磨等级暂时不管
			//洗练属性也不管
			
			createLine(10,curY+25,260);
			curY+=35;
			name=HtmlTextUtil.getTextColor(0xCFC6AE,"[装备产出]\n");
			label=createLabel(name,_itemInfo.qItem.q_describe);
			label.width=250;
			label.leading=5;
			label.wordWrap=true;
			label.x=10;
			label.y=curY;
			curY=curY+label.height+5;
			createLine(10,curY,260);
			
			name=HtmlTextUtil.getTextColor(0x8B8D7B,"售价:");
			value=HtmlTextUtil.getTextColor(0x5CB006,"     "+_itemInfo.qItem.q_sell_price.toString());
			_skin.container.addChild(yinIcon);
			label=createLabel(name,value);
			curY=curY+5
			label.x=10;
			label.y=curY;
			yinIcon.x=50;
			yinIcon.y=curY-5;
		}
		
		public function showDuiBiTips(data:ClientItemInfo):void
		{
			_skin.grp_duibi.visible=true;
			curY+=30;
			
			var equipItemInfo:ClientItemInfo=RoleEquipmentManager.instance.getEquipInfoByIndex(_itemInfo.qItem.q_kind);//根据佩戴部位获取已经装备的装备信息
			var equipFight:Number=FightValueUtil.getFightValueByEquip(_itemInfo);
			var currentFight:int=FightValueUtil.getFightValueByEquip(equipItemInfo);
			
			if(equipFight>currentFight){//装备后战斗力提升
				_skin.tip_up.visible=true;
			}else if(equipFight<currentFight){
				_skin.tip_down.visible=true;
			}
			var attValues2:Q_att_values=AttValueConfig.getAttInfoById(int(equipItemInfo.qItem.q_att_type));
			var map2:HashMap=new HashMap();
			
			for(var i:int=1;i<CharAttributeType.TYPE_NUM;i++){
				if(attValues2["q_value"+i]!=0){
					map2.add(attValues2["q_type"+i],attValues2["q_value"+i]);
				}
			}
			
			curY=curY+5;
			_skin.grp_duibi.y=curY;
			curY+=25;
			var num:int=0;
			var name:String;
			var value:String;
			for each(var id in ids){
				var value1:int=map1.getValue(id);
				var value2:int=map2.getValue(id);
				var change:int;
				if(value1!=0||value2!=0){
					change=value1-value2;
					num++;
				}else{
					continue;						
				}
				var valueName:String= CharAttributeType.getCNName(id);
				name=HtmlTextUtil.getTextColor(0xCFC6AE,valueName+":");
				if(change>=0){
					value=HtmlTextUtil.getTextColor(0x5CB006,"+"+change.toString());
				}else{
					value=HtmlTextUtil.getTextColor(0xE1201C,change.toString());
				}
				
				label=createLabel(name,value);
				if(num%2!=0){
					label.x=10;
				}else{
					label.x=155;
				}
				label.y=curY;
				if(num%2==0){
					curY+=25;
				}
			}
		
		_skin.imgBG.height=curY+30;
		}
		
		private function getLevele(num:int):String
		{
			var result:String=num.toString();
			switch(num){
				case 1:
					result="一阶";
					break;
				case 2:
					result="二阶";
					break;
				case 3:
					result="三阶";
					break;
				case 4:
					result="四阶";
					break;
				case 5:
					result="五阶";
					break;
				case 6:
					result="六阶";
					break;
				case 7:
					result="七阶";
					break;
				case 8:
					result="八阶";
					break;
				case 9:
					result="九阶";
					break;
				case 10:
					result="十阶";
					break;
			}
			return result;
		}
		
		private function createLabel(name:String,value:String):Label
		{
			var label:Label=new Label();
			label.fontSize=14;
			label.htmlText=name+value;
			_skin.container.addChild(label);
			labelList.push(label);
			return label;
		}
		
		private function getJobName(job:int):String
		{
			switch (job)
			{
				case JobEnum.ROLE_1_TYPE:
					return JobEnum.ROLE_1_NAME;
				case JobEnum.ROLE_2_TYPE:
				case JobEnum.ROLE_3_TYPE:
					return JobEnum.ROLE_2_NAME;
				case JobEnum.ROLE_4_TYPE:
					return JobEnum.ROLE_3_NAME;
			}
			return "不存在的职业"
		}
		
		private function createLine(x:int,y:int,w:int):void
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width=w;
			temp.x=x;
			temp.y=y;
			lines.push(temp);
			_skin.container.addChild(temp);
		}
	}
}