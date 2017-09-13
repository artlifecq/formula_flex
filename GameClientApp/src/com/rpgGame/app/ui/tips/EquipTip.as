package com.rpgGame.app.ui.tips
{
	import com.gameClient.log.GameLog;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.goods.RoleEquipmentManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.utils.FightValueUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.manager.tips.TipManager;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
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
	import com.rpgGame.coreData.type.item.GridBGType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import flash.geom.Point;
	
	import app.message.EquipType;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.app.tips.Tips_ZhuangBei;
	
	import starling.display.DisplayObject;
	
	/**
	 * 装备tips 
	 * @author Mandragora
	 * 
	 */	
	public class EquipTip extends SkinUI implements ITip
	{
		private var _itemTip:Tips_ZhuangBei;
		
		private static var _instance:EquipTip=null;
		private var _iconFace:IconCDFace;
		private var _itemInfo:EquipInfo;
		private var isShowDuiBi:Boolean;
		private var yinIcon:UIAsset;
		
		private var _equipTip:EquipTip;
		private var _isDuibiShow:Boolean;
		private var labelList:Vector.<Label>;
		private var lines:Vector.<UIAsset>;
		private var titles:Vector.<UIAsset>;
		private var pors:Vector.<ZhuangbeiTipPro>;
		
		private var uijiantou:UIAsset;
		
		public function EquipTip()
		{
			_itemTip=new Tips_ZhuangBei();
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
			labelList=new Vector.<Label>();
			lines=new Vector.<UIAsset>();
			titles=new Vector.<UIAsset>();
			pors=new Vector.<ZhuangbeiTipPro>();
			yinIcon=new UIAsset();
			yinIcon.styleName="ui/common/tubiao/yinzi_24.png";
		}
		
		
		public function updatePosition():void
		{
			if(_equipTip&&isShowDuiBi&&!_equipTip.parent){	
				createJianTou();
				var pos:Point =TipTargetManager.stagePoint;
				if(pos.x>=this._itemTip.width)
				{
					uijiantou.y=258;
					this._itemTip.container.addChild(uijiantou);			
					_equipTip.x=-(this.x+_itemTip.width+uijiantou.width);
					this._itemTip.container.addChild(_equipTip);
					uijiantou.x=-uijiantou.width;
				}else{
					uijiantou.y=258;
					this._itemTip.container.addChild(uijiantou);			
					_equipTip.x=this.x+_itemTip.width+uijiantou.width;
					this._itemTip.container.addChild(_equipTip);
					uijiantou.scaleX=-1;
					uijiantou.x=_itemTip.width+uijiantou.width;
				}
				TipManager.updatePositon();
			}
		}
		
		public function setTipData(data:*):void
		{
			_iconFace=IconCDFace.create(IcoSizeEnum.ICON_64);
			_iconFace.setBg(GridBGType.GRID_SIZE_64);
			_iconFace.alwayShowCount=false;
			addChild(_iconFace);
			_iconFace.x=13;
			_iconFace.y=39;
			_itemTip.container.addChild(_iconFace);
			_itemInfo = data as EquipInfo;
			if(_itemInfo==null){
				GameLog.addError( "装备TIP错误 ：MODID_"+(data as ClientItemInfo).qItem.q_id );
				return;
			}
			FaceUtil.SetItemGrid(_iconFace, _itemInfo, false);
			var info:HeroData=MainRoleManager.actorInfo;
			_itemTip.uiKuang.visible=false;
			while(labelList.length!=0){
				var l:Label=labelList.shift();
				l.removeFromParent(true);
			}
			while(lines.length!=0){
				var line:UIAsset=lines.shift();
				line.removeFromParent(true);
			}
			while(titles.length!=0){
				var title:UIAsset=titles.shift();
				title.removeFromParent(true);
			}
			
			while(pors.length!=0)
			{
				var por:ZhuangbeiTipPro=pors.shift();
				por.removeFromParent(true);
			}
			
			var equipItemInfo:ClientItemInfo=RoleEquipmentManager.instance.getEquipInfoByIndex(_itemInfo.qItem.q_kind);//根据佩戴部位获取已经装备的装备信息
			var equipFight:Number=_itemInfo.itemInfo.fightPower;
			var currentFight:int=0;
			_itemTip.numbers.number=equipFight;
			_itemTip.tip_down.visible=false;
			_itemTip.tip_up.visible=false;
			_itemTip.lb_power.visible=false;
			_itemTip.lbl_bangding.visible=false;
			if(equipItemInfo){
				currentFight=equipItemInfo.itemInfo.fightPower;
			}
			
			_itemTip.yizhuangbei.visible=false;
			isShowDuiBi=false;
			if(equipItemInfo){
				if(_itemInfo.itemInfo==equipItemInfo.itemInfo){
					_itemTip.yizhuangbei.visible=true;
				}else if((_itemInfo.qItem.q_job==0||_itemInfo.qItem.q_job==equipItemInfo.qItem.q_job)){//职业符合
					isShowDuiBi=true;
				}
			}
			
			if(_itemInfo.qItem.q_level==0){
				name=HtmlTextUtil.getTextColor(StaticValue.YELLOW_TEXT,"无限制");
			}else if(info.totalStat.level>=_itemInfo.qItem.q_level){
				name=HtmlTextUtil.getTextColor(StaticValue.YELLOW_TEXT,_itemInfo.qItem.q_level+"级");
			}else{
				name=HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,_itemInfo.qItem.q_level+"级");
			}
			_itemTip.lbl_xuqiu.htmlText=name;
			_itemTip.lbl_zhiye.text=ItemUtil.getJobName(_itemInfo.qItem.q_job);
			_itemTip.lbl_pingzhi.text=ItemUtil.getLevele(_itemInfo.qItem.q_levelnum);
			_itemTip.lbl_buwei.text=EquipType.EquipNames[_itemInfo.qItem.q_kind];
			
			createLine(8,166,263);
			
			_itemTip.lbl_titile.color=ItemConfig.getItemQualityColor(_itemInfo.cfgId);
			_itemTip.lbl_titile.text=_itemInfo.qItem.q_name+(_itemInfo.strengthLevel!=0?(" +"+_itemInfo.strengthLevel):"");
			
			var titleui:UIAsset;
			var name:String;
			var value:String;
			var attValues1:Q_att_values=AttValueConfig.getAttInfoById(int(_itemInfo.qItem.q_att_type));//基本属性
			var stren:Q_equip_strength=EquipStrengthCfg.getStrengthCfg(_itemInfo.qItem.q_kind,_itemInfo.qItem.q_job,_itemInfo.strengthLevel);
			var strenValues:Q_att_values=AttValueConfig.getAttInfoById(stren.q_att_type);//强化属性
			
			if(equipFight==0)//如果战斗力为0 都去算一次战斗力
			{
				_itemTip.numbers.number=FightValueUtil.calFightPowerByEquip(_itemInfo);
			}
			
			if(!attValues1){
				return ;
			}
			var map1:HashMap=AttValueConfig.getTypeValueMap(attValues1);
			if(strenValues!=null)
			{
				var map2:HashMap=AttValueConfig.getTypeValueMap(strenValues);
			}
			var label:Label;
			var curX:int=13;
			var curY:int=178;
			var num:int=0;
			var ids:Array=CharAttributeType.baseAttrIdArr;
			
			titleui=createUiAsset("jichushuxing");
			titleui.x=curX;
			titleui.y=curY;
			if(_itemInfo.qItem.q_max_strengthen!=0){
				name=HtmlTextUtil.getTextColor(StaticValue.YELLOW_TEXT,"强化等级:");
				if(_itemInfo.strengthLevel<_itemInfo.qItem.q_max_strengthen){
					value=HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,_itemInfo.strengthLevel+"/"+_itemInfo.qItem.q_max_strengthen);
				}else{
					value=HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,_itemInfo.strengthLevel+"/"+_itemInfo.qItem.q_max_strengthen);
				}				
				label=createLabel(name,value);
				label.x=145;
				label.y=curY;
				
			}
			curY+=17;
			//强化进度条
			if(_itemInfo.strengthExp>0&&_itemInfo.strengthLevel<_itemInfo.qItem.q_max_strengthen)
			{			
				var nowCfg:Q_equip_strength=EquipStrengthCfg.getStrengthCfg(_itemInfo.qItem.q_kind,_itemInfo.qItem.q_job,_itemInfo.strengthLevel);
				var nextCfg:Q_equip_strength=EquipStrengthCfg.getStrengthCfg(_itemInfo.qItem.q_kind,_itemInfo.qItem.q_job,_itemInfo.strengthLevel+1);
				name=HtmlTextUtil.getTextColor(StaticValue.YELLOW_TEXT,"强化进度");
				label=createLabel(name,"");
				label.x=curX;
				label.y=curY;
				var maxView:int=0;
				var view:int=0;
				if(nowCfg){
					maxView=nextCfg.q_exp-nowCfg.q_exp;
					view=_itemInfo.strengthExp-nowCfg.q_exp;
				}else{
					maxView=nextCfg.q_exp;
					view=_itemInfo.strengthExp;
				}
				var por_qianghua:ZhuangbeiTipPro=creatPor(view,maxView);
				por_qianghua.x=curX+label.textWidth+10;
				por_qianghua.y=curY;
				curY+=20;
			}
			
			var type:int;
			var per:String="";
			for each(type in ids){
				var attValue:Number=map1.getValue(type);
				if(attValue==0){
					continue;
				}
				num++;
				name=CharAttributeType.getCNName(type);
				
				name=HtmlTextUtil.getTextColor(StaticValue.GRAY_TEXT,name+":");
				value=HtmlTextUtil.getTextColor(StaticValue.BEIGE_TEXT,AttValueConfig.getDisAttValueStr(type,attValue));
				label=createLabel(name,value);
				label.x=curX;
				label.y=curY;
				if(map2!=null)
				{
					var sten:Number=map2.getValue(type);
					if(sten!=0){
						value=HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,"    (强化+"+AttValueConfig.getDisAttValueStr(type,sten)+")");
						label=createLabel("",value);
						label.x=123;
						label.y=curY;
					}
				}
				curY+=20;
			}
			
			curY+=4;
			//琢磨等级
			createLine(curX,curY,263);
			curY+=13;
			titleui=createUiAsset("zhuomodengji");
			titleui.x=curX;
			titleui.y=curY;
			curY+=17;
			
			//琢磨进度条
			if(_itemInfo.polishExp>0&&_itemInfo.polishLevel<EquipPolishCfg.maxLv)
			{			
				var nowpolishCfg:Q_equip_polish=EquipPolishCfg.getPolishCfg(_itemInfo.polishLevel);
				var nextpolishCfg:Q_equip_polish=EquipPolishCfg.getPolishCfg(_itemInfo.polishLevel+1);
				name=HtmlTextUtil.getTextColor(StaticValue.YELLOW_TEXT,"琢磨进度");
				label=createLabel(name,"");
				label.x=curX;
				label.y=curY;
				if(nowpolishCfg){
					maxView=nextpolishCfg.q_exp-nowpolishCfg.q_exp;
					view=_itemInfo.polishExp-nowpolishCfg.q_exp;
				}else{
					maxView=nextpolishCfg.q_exp;
					view=_itemInfo.polishExp;
				}
				por_qianghua=creatPor(view,maxView);
				por_qianghua.x=curX+label.textWidth+10;
				por_qianghua.y=curY;
				curY+=20;
			}
			
			name=HtmlTextUtil.getTextColor(StaticValue.GRAY_TEXT,"琢磨等级:");
			value=HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,_itemInfo.polishLevel+"");
			label=createLabel(name,value);
			label.x=curX;
			label.y=curY;
			curY+=20;
			
			if(_itemInfo.polishLevel==0){
				name=HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,"未激活");
				label=createLabel(name,"");
				label.x=curX;
				label.y=curY;
			}else{
				var cfg:Q_equip_polish=EquipPolishCfg.getPolishCfg(_itemInfo.polishLevel);
				name=HtmlTextUtil.getTextColor(StaticValue.GRAY_TEXT,"装备属性提升:");
				value=HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,(cfg.q_promote/1000).toFixed(1)+"%");
				label=createLabel(name,value);
				label.x=curX;
				label.y=curY;
			}
			
			//洗练属性
			curY+=27;
			createLine(curX,curY,263);
			curY+=13;
			titleui=createUiAsset("xilianshuxing");
			titleui.x=curX;
			titleui.y=curY;
			curY+=17;
			name=HtmlTextUtil.getTextColor(StaticValue.GRAY_TEXT,"");
			if(_itemInfo.smeltAtt1!=0){
				value=CharAttributeType.getWashName(_itemInfo.smeltAtt1);
			}else{
				value=HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,"未激活");
			}
			label=createLabel(name,value);
			label.x=curX;
			label.y=curY;
			curY+=20;
			if(_itemInfo.smeltAtt2!=0){
				value=CharAttributeType.getWashName(_itemInfo.smeltAtt2);
			}else{
				value=HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,"未激活");
			}
			label=createLabel(name,value);
			label.x=curX;
			label.y=curY;
			curY+=27;
			
			//装备产出
			createLine(curX,curY,263);
			curY+=13;
			titleui=createUiAsset("zhuangbeichanchu");
			titleui.x=curX;
			titleui.y=curY;
			curY+=17;
			name=HtmlTextUtil.getTextColor(StaticValue.BEIGE_TEXT,_itemInfo.qItem.q_output);
			label=createLabel(name,"");
			label.x=curX;
			label.y=curY;
			
			//装备价值
			if (_itemInfo.qItem.q_sell==1) 
			{
				curY+=27;
				createLine(curX,curY,263);
				curY+=13;
				titleui=createUiAsset("chushoujiage");
				titleui.x=curX;
				titleui.y=curY;
				curY+=17;
				name=HtmlTextUtil.getTextColor(StaticValue.GRAY_TEXT,"售价:");
				value=HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,"    "+_itemInfo.qItem.q_sell_price.toString());
				_itemTip.container.addChild(yinIcon);
				label=createLabel(name,value);
				label.x=curX;
				label.y=curY;
				yinIcon.x=52;
				yinIcon.y=curY-4;
				
				_itemTip.lbl_bangding.y=label.y;
				_itemTip.lbl_bangding.visible=true;
				if(_itemInfo.binded){
					_itemTip.lbl_bangding.text="【已绑定】";
				}else{
					if(_itemInfo.qItem.q_bind==0){
						_itemTip.lbl_bangding.visible=false;
					}else if(_itemInfo.qItem.q_bind==1){
						_itemTip.lbl_bangding.text="【获得时绑定】";
					}else{
						_itemTip.lbl_bangding.text="【使用后绑定】";
					}
				}
				
			}else{
				MCUtil.removeSelf(yinIcon);
				_itemTip.lbl_bangding.visible=false;
			}
			
			//			_itemTip.lbl_titile.text=FightValueUtil.calFightPowerByEquip(_itemInfo).toString();
			
			//装备对比
			if(isShowDuiBi&&!_isDuibiShow){
				curY+=27;
				createLine(curX,curY,263);
				curY+=13;
				titleui=createUiAsset("shuxingduibi");
				titleui.x=curX;
				titleui.y=curY;
				curY+=17;
				showCurrentEquipInfo(equipItemInfo);
				if(equipFight>currentFight){//装备后战斗力提升
					_itemTip.tip_up.visible=true;
					_itemTip.lb_power.text=(equipFight-currentFight).toString();
					_itemTip.lb_power.color=StaticValue.GREEN_TEXT;
					_itemTip.lb_power.visible=true;
					_itemTip.uiKuang.visible=true;
					if(_equipTip)
						_equipTip.setkuangState(false);
				}else if(equipFight<currentFight){
					_itemTip.tip_down.visible=true;
					_itemTip.lb_power.text=(currentFight-equipFight).toString();
					_itemTip.lb_power.color=StaticValue.RED_TEXT;
					_itemTip.lb_power.visible=true;
					_itemTip.uiKuang.visible=false;
					if(_equipTip)
						_equipTip.setkuangState(true);
				}
				var attValues2:Q_att_values=AttValueConfig.getAttInfoById(int(equipItemInfo.qItem.q_att_type));
				map2=AttValueConfig.getTypeValueMap(attValues2);
				num=0;
				for each(type in ids){
					var value1:int=map1.getValue(type);
					value1=AttValueConfig.getDisAttValue(type,value1);
					var value2:int=map2.getValue(type);
					value2=AttValueConfig.getDisAttValue(type,value2);
					var change:int;
					if(value1!=0||value2!=0){
						change=value1-value2;
						num++;
					}else{
						continue;						
					}
					var valueName:String= CharAttributeType.getCNName(type);
					name=HtmlTextUtil.getTextColor(StaticValue.GRAY_TEXT,valueName+":");
					if(change>=0){
						value=HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,"+"+change.toString());
					}else{
						value=HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,change.toString());
					}
					
					label=createLabel(name,value);
					if(num%2!=0){
						label.x=curX;
					}else{
						label.x=155;
					}
					label.y=curY;
					if(num%2==0){
						curY+=20;
					}
				}
			}else{
				if(_equipTip){
					_equipTip.removeFromParent();
					_equipTip.setkuangState(false);
				}
				if(uijiantou)
				{
					uijiantou.removeFromParent(true);
				}
			}
			for(var i:int=0;i<_itemTip.bg.numChildren;i++){
				_itemTip.bg.getChildAt(i).visible=false;
			}
			var obj:DisplayObject=_itemTip.bg.getChildAt(_itemInfo.qItem.q_default);
			if(!obj) obj=_itemTip.bg.getChildAt(0);
			var ui_bg:UIAsset=obj as UIAsset;
			ui_bg.visible=true;
			ui_bg.height=curY;
			_itemTip.ui_di.y=ui_bg.height;
			_itemTip.ui_di.visible=true;			
			
			_itemTip.bg.height=_itemTip.ui_di.y+_itemTip.ui_di.height;
			_itemTip.uiKuang.height=_itemTip.ui_di.y+_itemTip.ui_di.height;
		}
		
		public function setkuangState(bool:Boolean):void
		{
			_itemTip.uiKuang.visible=bool;
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
		
		//创建美术资源——UIASSET
		private function createUiAsset(name:String):UIAsset
		{
			var uiasset:UIAsset=new UIAsset();
			uiasset.name = name;
			uiasset.height = 17;
			uiasset.styleName = "ui/art_txt/common/tips/zhuangbei/"+name+".png";
			titles.push(uiasset);
			_itemTip.container.addChild(uiasset);
			return uiasset;
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
			temp.styleName = "ui/common/tips/xian.png";
			temp.width=w;
			temp.x=x;
			temp.y=y;
			lines.push(temp);
			_itemTip.container.addChild(temp);
		}
		
		private function createJianTou():UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uijiantou=temp;
			temp.styleName = "ui/common/jiantou.png";
			temp.width=30;
			temp.height=45;
			return temp;
		}
		
		private function creatPor(view:int,max:int):ZhuangbeiTipPro
		{
			var por:ZhuangbeiTipPro=new ZhuangbeiTipPro();
			por.setDate(view,max);
			pors.push(por);
			_itemTip.container.addChild(por);
			return por;
		}
		
		/**
		 * 移除装备tips 
		 * 
		 */		
		public function hideTips():void
		{
			if(_equipTip){
				_equipTip.removeFromParent();
				_equipTip.setkuangState(false);
			}
			if(uijiantou)
			{
				uijiantou.removeFromParent(true);
			}
		}
		
		/**
		 * 获取装备tips默认的背景高度 
		 * @return 
		 * 
		 */		
		public override function get height():Number
		{
			return _itemTip.bg.height;
		}
	}
}
