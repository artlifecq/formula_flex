package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.manager.fight.FightValueUtil;
	import com.rpgGame.app.manager.goods.RoleEquipmentManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.item.GridBGType;
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
		private var _itemInfo:ClientItemInfo;
		private var isShowDuiBi:Boolean;
		private var goldIcon:UIAsset;
		private var yinIcon:UIAsset;
		
		private var _equipTip:EquipTip;
		private var _isDuibiShow:Boolean;

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
			_iconFace=new IconCDFace(IcoSizeEnum.SIZE_60);
			addChild(_iconFace);
			_iconFace.setBg(GridBGType.GRID_SIZE_60);
			_iconFace.x=30;
			_iconFace.y=67;
			_iconFace.setIconPoint(8, 8);
			
			goldIcon=new UIAsset();
			goldIcon.styleName="ui/common/tubiao/lijin_24.png";
			yinIcon=new UIAsset();
			yinIcon.styleName="ui/common/tubiao/yinzi_24.png";
		}

		public function setTipData(data:*):void
		{
			_itemInfo = data as ClientItemInfo;
			
			var info:HeroData=MainRoleManager.actorInfo;
			var currentFight:int=info.totalStat.getStatValue(CharAttributeType.FIGHTING);
			
			_itemTip.lbl_titile.text=_itemInfo.qItem.q_name;
			var equipFight:Number=FightValueUtil.getFightValueByEquip(_itemInfo);
			if(equipFight>currentFight){//装备后战斗力提升
				
			}else{
				
			}
			
			_itemTip.isLock.visible=true;
			if(_itemInfo.binded){
				_itemTip.isLock.text="[已绑定]"
			}else{
				if(_itemInfo.qItem.q_bind==0){
					_itemTip.isLock.visible=false;
				}else if(_itemInfo.qItem.q_bind==1){
					_itemTip.isLock.visible="[获得时绑定]";
				}else{
					_itemTip.isLock.visible="[使用后绑定]";
				}
			}
			
			var equipItemInfo:ClientItemInfo=RoleEquipmentManager.instance.getEquipInfoByIndex(_itemInfo.qItem.q_kind);//根据佩戴部位获取已经装备的装备信息
			_itemTip.yizhuangbei.visible=false;
			isShowDuiBi=false;
			if(equipItemInfo){
				if(_itemInfo==equipItemInfo){
					_itemTip.yizhuangbei.visible=true;
				}else{
					isShowDuiBi=true;
				}
			}
			
			_itemTip.lbl_xuqiu.text=_itemInfo.qItem.q_level+"级";
			_itemTip.lbl_zhiye.text=getJobName(_itemInfo.qItem.q_job);
			_itemTip.lbl_pingzhi.text=getJobName(_itemInfo.qItem.q_levelnum);
			_itemTip.lbl_buwei.text=EquipType.EquipNames[_itemInfo.qItem.q_kind];
			
			if(_itemInfo.qItem.q_max_strengthen!=0){
				_itemTip.lbl_qianghuatitle.visible=true;
				_itemTip.lbl_qianghua.visible=_itemInfo.qItem.q_max_strengthen.toString();
			}else{
				_itemTip.lbl_qianghuatitle.visible=false;
			}
			
			_itemTip.lbl_gongji.text=FightValueUtil.getGongJi(_itemInfo).toString();
			_itemTip.lbl_mingzhong.text=FightValueUtil.getMingZhong(_itemInfo).toString();
			_itemTip.lbl_baoji.text=FightValueUtil.getBaoJi(_itemInfo).toString();
			
			//琢磨等级暂时不管
			//洗练属性也不管
			
			createLine(10,260,270);
			
			var name:String;
			var value:String;
			name=HtmlTextUtil.getTextColor(0xCFC6AE,"[装备产出]\n");
			var label:Label=createLabel(name,_itemInfo.qItem.q_describe);
			label.width=250;
			label.leading=5;
			label.wordWrap=true;
			label.x=10;
			label.y=265;
			var curY:int=265+label.height;
			createLine(10,curY,270);
			
			name=HtmlTextUtil.getTextColor(0x8B8D7B,"售价:");
			if(_itemInfo.qItem.q_gold==0){
				value=HtmlTextUtil.getTextColor(0x5CB006,"      "+_itemInfo.qItem.q_gold.toString());
				yinIcon.removeFromParent();
				_itemTip.container.addChild(goldIcon);
			}else{
				value=HtmlTextUtil.getTextColor(0x5CB006,"     "+_itemInfo.qItem.q_sell_price.toString());
				goldIcon.removeFromParent();
				_itemTip.container.addChild(yinIcon);
			}
			label=createLabel(name,value);
			curY=curY+5
			label.x=10;
			label.y=curY;
			goldIcon.x=yinIcon.x=100;
			goldIcon.y=yinIcon.y=curY;
			
			
			_itemTip.grp_duibi.visible=false;
			if(isShowDuiBi&&!_isDuibiShow){
				showCurrentEquipInfo(equipItemInfo);
				
				curY=curY+5;
				_itemTip.grp_duibi.y=curY;
				curY+=25;
				
				var attValues1:Q_att_values=AttValueConfig.getAttInfoById(int(_itemInfo.qItem.q_att_type));
				var attValues2:Q_att_values=AttValueConfig.getAttInfoById(int(equipItemInfo.qItem.q_att_type));
				var map1:HashMap=new HashMap();
				var map2:HashMap=new HashMap();
				for(var i:int=1;i<CharAttributeType.TYPE_NUM;i++){
					if(attValues1["q_value"+i]!=0){
						map1.add(attValues1["q_type"+i],attValues1["q_value"+i]);
					}
					if(attValues2["q_value"+i]!=0){
						map2.add(attValues2["q_type"+i],attValues2["q_value"+i]);
					}
				}
				
				var ids:Array=CharAttributeType.baseAttrIdArr;
				var duibiNum:int=0;
				for each(var id:int in ids){
					var value1:int=map1.getValue(id);
					var value2:int=map2.getValue(id);
					var change:int;
					if(value1!=0||value2!=0){
						change=value1-value2;
						duibiNum++;
					}
					var valueName:String= CharAttributeType.getCNName(id);
					name=HtmlTextUtil.getTextColor(0xCFC6AE,valueName+":");
					if(change>=0){
						value=HtmlTextUtil.getTextColor(0x5CB006,"+"+change.toString());
					}else{
						value=HtmlTextUtil.getTextColor(0xE1201C,change.toString());
					}
					
					label=createLabel(name,value);
					if(duibiNum%2!=0){
						label.x=10;
					}else{
						label.x=155;
					}
					label.y=curY;
					if(duibiNum%2==0){
						curY+=25;
					}
				}
			}
			
			_itemTip.imgBG.height=curY+25;
		}
		
		private function showCurrentEquipInfo(equipItemInfo:ClientItemInfo):void
		{
			if(!_equipTip){
				_equipTip=new EquipTip();
			}
			_equipTip.setTipData(equipItemInfo);
			_equipTip.isShowDuiBi=true;
		}		
		
		private function createLabel(name:String,value:String):Label
		{
			var label:Label=new Label();
			label.fontSize=14;
			label.htmlText=name+value;
			_itemTip.container.addChild(label);
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

