package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.manager.goods.RoleEquipmentManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.manager.tips.TipManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.item.EquipPolishCfg;
	import com.rpgGame.coreData.cfg.item.EquipStrengthCfg;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.clientConfig.Q_equip_polish;
	import com.rpgGame.coreData.clientConfig.Q_equip_strength;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import app.message.EquipType;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import org.client.mainCore.ds.HashMap;
	import org.mokylin.skin.app.tips.zhuangbeiTips_Skin;
	
	/**
	 * 装备tips 
	 * @author Mandragora
	 * 
	 */	
	public class EquipTip extends SkinUI implements ITip
	{
		private var _itemTip:zhuangbeiTips_Skin;

		private static var _instance:EquipTip=null;
		private var _iconFace:IconCDFace;
		private var _itemInfo:EquipInfo;
		private var isShowDuiBi:Boolean;
		private var yinIcon:UIAsset;
		
		private var _equipTip:EquipTip;
		private var _isDuibiShow:Boolean;
		private var labelList:Vector.<Label>;
		private var lines:Vector.<UIAsset>;

		public function EquipTip()
		{
			_itemTip=new zhuangbeiTips_Skin();
			super(_itemTip);
			initTip();
		}

		public function set isDuibiShow(value:Boolean):void
		{
			_isDuibiShow = value;
		}

		public static function get instance():EquipTip
		{
			if (null == _instance)
			{
				_instance=new EquipTip();
			}
			return _instance;
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
			_itemTip.container.addChild(_iconFace);
			labelList=new Vector.<Label>();
			lines=new Vector.<UIAsset>();
			yinIcon=new UIAsset();
			yinIcon.styleName="ui/common/tubiao/yinzi_24.png";
		}
		
		
		public function updatePosition():void
		{
			if(_equipTip&&isShowDuiBi&&!_equipTip.parent){
				this._itemTip.container.addChild(_equipTip);
				_equipTip.x=this.x+this.width;
				TipManager.updatePositon();
			}
		}
		
		public function setTipData(data:*):void
		{
			_itemInfo = data as EquipInfo;
			FaceUtil.SetItemGrid(_iconFace, _itemInfo, false);
			var info:HeroData=MainRoleManager.actorInfo;
			while(labelList.length!=0){
				var l:Label=labelList.shift();
				l.removeFromParent(true);
			}
			while(lines.length!=0){
				var line:UIAsset=lines.shift();
				line.removeFromParent(true);
			}
			
			var equipItemInfo:ClientItemInfo=RoleEquipmentManager.instance.getEquipInfoByIndex(_itemInfo.qItem.q_kind);//根据佩戴部位获取已经装备的装备信息
			var equipFight:Number=_itemInfo.itemInfo.fightPower;
			var currentFight:int=0;
			_itemTip.numbers.number=equipFight;
			_itemTip.tip_down.visible=false;
			_itemTip.tip_up.visible=false;
			if(equipItemInfo){
				currentFight=equipItemInfo.itemInfo.fightPower;
			}
			
			_itemTip.isLock.visible=true;
			if(_itemInfo.binded){
				_itemTip.isLock.text="[已绑定]"
			}else{
				if(_itemInfo.qItem.q_bind==0){
					_itemTip.isLock.visible=false;
				}else if(_itemInfo.qItem.q_bind==1){
					_itemTip.isLock.text="[获得时绑定]";
				}else{
					_itemTip.isLock.text="[使用后绑定]";
				}
			}
			
			_itemTip.yizhuangbei.visible=false;
			isShowDuiBi=false;
			if(equipItemInfo){
				if(_itemInfo.itemInfo==equipItemInfo.itemInfo){
					_itemTip.yizhuangbei.visible=true;
				}else if(_itemInfo.qItem.q_job==0||_itemInfo.qItem.q_job==equipItemInfo.qItem.q_job){//职业符合
					isShowDuiBi=true;
				}
			}
			
			if(_itemInfo.qItem.q_level==0){
				name=HtmlTextUtil.getTextColor(0xCFC6AE,"无限制");
			}else if(info.totalStat.level>=_itemInfo.qItem.q_level){
				name=HtmlTextUtil.getTextColor(0xCFC6AE,_itemInfo.qItem.q_level+"级");
			}else{
				name=HtmlTextUtil.getTextColor(0xE1201C,_itemInfo.qItem.q_level+"级");
			}
			_itemTip.lbl_xuqiu.htmlText=name;
			_itemTip.lbl_zhiye.text=ItemUtil.getJobName(_itemInfo.qItem.q_job);
			_itemTip.lbl_pingzhi.text=ItemUtil.getLevele(_itemInfo.qItem.q_levelnum);
			_itemTip.lbl_buwei.text=EquipType.EquipNames[_itemInfo.qItem.q_kind];
			
			if(_itemInfo.qItem.q_max_strengthen!=0){
				_itemTip.lbl_qianghuatitle.visible=true;
				_itemTip.lbl_qianghua.visible=true;
				_itemTip.lbl_qianghua.text=_itemInfo.strengthLevel+"/"+_itemInfo.qItem.q_max_strengthen;
				_itemTip.lbl_qianghua.y=_itemTip.lbl_qianghuatitle.y=170;
				if(_itemInfo.strengthLevel<_itemInfo.qItem.q_max_strengthen){
					_itemTip.lbl_qianghua.color=0x6BCC08;
				}else{
					_itemTip.lbl_qianghua.color=0xE1201C;
				}
			}else{
				_itemTip.lbl_qianghuatitle.visible=false;
				_itemTip.lbl_qianghua.visible=false;
			}
			
			createLine(10,160,260);
			
			for(var i:int=0;i<_itemTip.zhuangbei_bg.numChildren;i++){
				_itemTip.zhuangbei_bg.getChildAt(i).visible=false;
				_itemTip.grp_titlebg.getChildAt(i).visible=false;
			}
			_itemTip.zhuangbei_bg.getChildAt(_itemInfo.qItem.q_default).visible=true;
			_itemTip.grp_titlebg.getChildAt(_itemInfo.qItem.q_default).visible=true;
			
			_itemTip.lbl_titile.color=ItemConfig.getItemQualityColor(_itemInfo.cfgId);
			_itemTip.lbl_titile.text=_itemInfo.qItem.q_name+(_itemInfo.strengthLevel!=0?(" +"+_itemInfo.strengthLevel):"");
			
			var name:String;
			var value:String;
			var attValues1:Q_att_values=AttValueConfig.getAttInfoById(int(_itemInfo.qItem.q_att_type));
			var stren:Q_equip_strength=EquipStrengthCfg.getStrengthCfg(_itemInfo.qItem.q_kind,_itemInfo.qItem.q_job,_itemInfo.strengthLevel);
			var strenValues:Q_att_values=AttValueConfig.getAttInfoById(stren.q_att_type);
			if(!attValues1){
				return ;
			}
			var map1:HashMap=new HashMap();
			var map2:HashMap=new HashMap();
		
			var label:Label;
			var curY:int=170;
			var num:int=0;
			for(i=1;i<CharAttributeType.TYPE_NUM;i++){
				if(attValues1["q_value"+i]!=0){
					map1.add(attValues1["q_type"+i],attValues1["q_value"+i]);
					map2.add(strenValues["q_type"+i],strenValues["q_value"+i]);
				}
			}
			var ids:Array=CharAttributeType.baseAttrIdArr;
			name=HtmlTextUtil.getTextColor(0xCFC6AE,"[基础属性]\n");
			label=createLabel(name,"");
			label.x=10;
			label.y=curY;
			var id:int;
			var per:String="";
			for each(id in ids){
				var v:Number=map1.getValue(id);
				if(v==0){
					continue;
				}
				curY+=25;
				
				num++;
				name=CharAttributeType.getCNName(id);
				if(name.indexOf("率")!=-1||name.indexOf("百分比")!=-1){
					per="%";
					v/=100;
				}else{
					per="";
				}
				name=HtmlTextUtil.getTextColor(0x8B8D7B,name+":");
				value=HtmlTextUtil.getTextColor(0xCFC6AE,v+per);
				label=createLabel(name,value);
				label.x=10;
				label.y=curY;
				var sten:Number=map2.getValue(id);
				if(sten!=0){
					if(per=="%"){
						sten/=100;
					}
					value=HtmlTextUtil.getTextColor(0x5CB006,"    (强化+"+sten+per+")");
					label=createLabel("",value);
					label.x=123;
					label.y=curY;
				}
			}
			curY+=25;
			
			//琢磨等级
			createLine(10,curY,260);
			curY+=10;
			name=HtmlTextUtil.getTextColor(0xCFC6AE,"琢磨等级:");
			value=HtmlTextUtil.getTextColor(0x5CB006,_itemInfo.polishLevel+"");
			label=createLabel(name,value);
			label.x=10;
			label.y=curY;
			curY=curY+label.height+5;
			if(_itemInfo.polishLevel==0){
				name=HtmlTextUtil.getTextColor(0xE1201C,"未激活");
			}else{
				var cfg:Q_equip_polish=EquipPolishCfg.getPolishCfg(_itemInfo.polishLevel);
				name=HtmlTextUtil.getTextColor(0xCFC6AE,"装备基础属性提升:");
				value=HtmlTextUtil.getTextColor(0x5CB006,(cfg.q_promote/100).toFixed(1)+"%");
				label=createLabel(name,value);
				label.x=10;
				label.y=curY;
				curY=curY+label.height+5;
			}
			
			//洗练属性
			createLine(10,curY,260);
			curY+=10;
			name=HtmlTextUtil.getTextColor(0xCFC6AE,"[洗炼属性]\n");
			label=createLabel(name,"");
			label.x=10;
			label.y=curY;
			curY=curY+label.height+5;
			name=HtmlTextUtil.getTextColor(0x8B8D7B,"");
			if(_itemInfo.smeltAtt1!=0){
				value=CharAttributeType.getWashAttDes(_itemInfo.smeltAtt1);
			}else{
				value=HtmlTextUtil.getTextColor(0xD02525,"未激活");
			}
			label=createLabel(name,value);
			label.x=10;
			label.y=curY;
			curY=curY+label.height+5;
			if(_itemInfo.smeltAtt2!=0){
				value=CharAttributeType.getWashAttDes(_itemInfo.smeltAtt2);
			}else{
				value=HtmlTextUtil.getTextColor(0xD02525,"未激活");
			}
			label=createLabel(name,value);
			label.x=10;
			label.y=curY;
			curY=curY+label.height+5;
			
			createLine(10,curY,260);
			curY+=10;
			name=HtmlTextUtil.getTextColor(0xCFC6AE,"[装备产出]\n");
			label=createLabel(name,_itemInfo.qItem.q_output);
			label.width=250;
			label.leading=5;
			label.wordWrap=true;
			label.x=10;
			label.y=curY;
			curY=curY+label.height+5;
			createLine(10,curY,260);
			
			name=HtmlTextUtil.getTextColor(0x8B8D7B,"售价:");
			value=HtmlTextUtil.getTextColor(0x5CB006,"     "+_itemInfo.qItem.q_sell_price.toString());
			_itemTip.container.addChild(yinIcon);
			label=createLabel(name,value);
			curY=curY+5
			label.x=10;
			label.y=curY;
			yinIcon.x=50;
			yinIcon.y=curY-5;
			
//			curY+=yinIcon.y+yinIcon.height+10;
			
			
			_itemTip.grp_duibi.visible=false;
			if(isShowDuiBi&&!_isDuibiShow){
				_itemTip.grp_duibi.visible=true;
				curY+=30;
				showCurrentEquipInfo(equipItemInfo);
				if(equipFight>currentFight){//装备后战斗力提升
					_itemTip.tip_up.visible=true;
				}else if(equipFight<currentFight){
					_itemTip.tip_down.visible=true;
				}
				var attValues2:Q_att_values=AttValueConfig.getAttInfoById(int(equipItemInfo.qItem.q_att_type));
				map2=new HashMap();
				
				for(i=1;i<CharAttributeType.TYPE_NUM;i++){
					if(attValues2["q_value"+i]!=0){
						map2.add(attValues2["q_type"+i],attValues2["q_value"+i]);
					}
				}
				
				curY=curY+5;
				_itemTip.grp_duibi.y=curY;
				curY+=25;
				num=0;
				for each(id in ids){
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
			}else{
				if(_equipTip){
					_equipTip.removeFromParent();
				}
			}
			
			_itemTip.imgBG.height=curY+30;
		}
		
		
		
		private function showCurrentEquipInfo(equipItemInfo:ClientItemInfo):void
		{
			if(!_equipTip){
				_equipTip=new EquipTip();
			}
			_equipTip.setTipData(equipItemInfo);
			_equipTip.isShowDuiBi=true;
			updatePosition();
		}		
		
		private function createLabel(name:String,value:String):Label
		{
			var label:Label=new Label();
			label.fontSize=14;
			label.htmlText=name+value;
			_itemTip.container.addChild(label);
			labelList.push(label);
			return label;
		}
		
		private function createLine(x:int,y:int,w:int):void
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width=w;
			temp.x=x;
			temp.y=y;
			lines.push(temp);
			_itemTip.container.addChild(temp);
		}
		
		/**
		 * 移除装备tips 
		 * 
		 */		
		public function hideTips():void
		{
		
		}

		/**
		 * 获取装备tips默认的背景高度 
		 * @return 
		 * 
		 */		
		public override function get height():Number
		{
			return _itemTip.imgBG.height;
		}
	}
}

