package com.rpgGame.app.ui.tips
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.HunYinManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.utils.FightValueUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.hunyin.JieHunJieZiData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_advance_wedding;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.app.hunyin.Tips_HunJie;
	
	import starling.display.DisplayObject;
	
	public class HunJieTip extends SkinUI implements ITip
	{
		private var _skin:Tips_HunJie;
		
		private var _hunjieLv:int;
		
		private var _iconFace:IconCDFace;
		private var labelList:Vector.<Label>;
		
		public function HunJieTip()
		{
			_skin=new Tips_HunJie();
			super(_skin);
			labelList=new Vector.<Label>();
			MCUtil.removeSelf(_skin.tip_up);
			MCUtil.removeSelf(_skin.tip_down);
		}
		
		private function initview():void
		{
			for(var i:int=0;i<3;i++)
			{
				(_skin.bg.getChildAt(i) as UIAsset).visible=false;
			}
			while(labelList.length!=0){
				var l:Label=labelList.shift();
				l.removeFromParent(true);
			}
		}
		
		public function setTipData(data:*):void
		{
			initview();
			_iconFace=IconCDFace.create(IcoSizeEnum.ICON_64);
			_iconFace.bindBg(_skin.ui_kuang);
			_iconFace.alwayShowCount=false;
			_skin.grp_icon.addChild(_iconFace);
			_hunjieLv=data as int;
			var info:Q_advance_wedding=JieHunJieZiData.getModByLv(_hunjieLv);		
			var itemInfo:ClientItemInfo=ItemUtil.convertClientItemInfoById(info.q_mod_id);
			
			var obj:DisplayObject=_skin.bg.getChildAt(itemInfo.qItem.q_default-3);
			if(!obj) obj=_skin.bg.getChildAt(0);
			var ui_bg:UIAsset=obj as UIAsset;
			ui_bg.visible=true;
			FaceUtil.SetItemGrid(_iconFace,itemInfo);
			//名字
			_skin.lbTitle.color=ItemConfig.getItemQualityColor(itemInfo.cfgId);
			_skin.lbTitle.text=itemInfo.qItem.q_name;
			//等阶
			_skin.numJie.label=info.q_strength.toString();
			//需求等级
			_skin.lbl_xuqiu.text=itemInfo.qItem.q_level+"级";
			if(MainRoleManager.actorInfo.totalStat.level>=itemInfo.qItem.q_level)
				_skin.lbl_xuqiu.color=StaticValue.GREEN_TEXT;
			else _skin.lbl_xuqiu.color=StaticValue.RED_TEXT;
			//品质等级
			_skin.lbl_pingzhi.text=info.q_strength.toString()+"阶";
			
			//基础属性
			var keys:Array;
			var values:Array;
			var name:String;
			var value:String;
			var label:Label;
			var power:int=0;
			var initX:int=11;
			var initY:int=180;
			if(info)
			{
				var has:HashMap=new HashMap();
				var attValues:Q_att_values= AttValueConfig.getAttInfoById(HunYinManager.ins.getAttId(info));
				has=AttValueConfig.getTypeValueMap(attValues);
				keys=has.keys();
				values=has.values();
				for(var i:int=0;i<keys.length;i++)
				{
					name=CharAttributeType.getCNName(keys[i]);				
					name=HtmlTextUtil.getTextColor(StaticValue.GRAY_TEXT,name+":");
					value=HtmlTextUtil.getTextColor(StaticValue.BEIGE_TEXT,AttValueConfig.getDisAttValue(keys[i],values[i]).toString());
					label=createLabel(name,value);
					label.x=initX;
					label.y=initY;
					initY+=label.height+2;
				}
				power=FightValueUtil.calFightPowerByAttValue(attValues,MainRoleManager.actorInfo.job);
			}
			_skin.numbers.label=power.toString();
			ui_bg.height=initY-13;
			_skin.bg_di.y=ui_bg.height;			
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
		
		public function hideTips():void
		{
			//			_iconFace.destroy();
		}
		
		private static var _instance:HunJieTip=null;
		public static function get instance():HunJieTip
		{
			if (null == _instance)
			{
				_instance=new HunJieTip();
			}
			return _instance;
		}
	}
}