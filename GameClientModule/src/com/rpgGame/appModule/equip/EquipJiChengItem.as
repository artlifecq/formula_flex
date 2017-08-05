package com.rpgGame.appModule.equip
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.utils.TouchableUtil;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.BuffStateDataManager;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.item.EquipPolishCfg;
	import com.rpgGame.coreData.cfg.item.EquipStrengthCfg;
	import com.rpgGame.coreData.cfg.item.EquipWashAttCfg;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.clientConfig.Q_buff;
	import com.rpgGame.coreData.clientConfig.Q_equip_polish;
	import com.rpgGame.coreData.clientConfig.Q_equip_strength;
	import com.rpgGame.coreData.clientConfig.Q_equip_wash_attr;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.lang.LangUI;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import feathers.controls.Label;
	import feathers.controls.text.Fontter;
	
	import org.mokylin.skin.app.zhuangbei.jicheng.JiChengType_Item;
	
	import starling.display.Sprite;
	
	
	/**装备继承选项*/
	public class EquipJiChengItem extends SkinUI
	{		
		private var _skin:JiChengType_Item;
		
		private var _type:int=0;
		//lable容器
		private var _labContainer:Sprite;
		private var _labList:Vector.<Label>;
		
		private var _isSelect:Boolean=false;
		
		public function EquipJiChengItem()
		{
			_skin=new JiChengType_Item();
			super(_skin);
			_labContainer=new Sprite();
			_labList=new Vector.<Label>();
		}
		
		public function SetData(type:int):void
		{
			_type=type;
			TouchableUtil.gray(_skin.rdo_type);
			TouchableUtil.gray(_skin.uiHead);
			TouchableUtil.gray(_skin.labelDisplay);
			//			_skin.rdo_type.isEnabled=false;
			switch(_type)
			{
				case 0:
//					_skin.rdo_type.label=LanguageConfig.getText(LangUI.UI_TEXT18);
					_skin.uiHead.styleName="ui/app/zhuangbei/jicheng/qianghua.png";
					_skin.labelDisplay.htmlText=LanguageConfig.getText(LangUI.UI_TEXT21)+HtmlTextUtil.getTextColor(0x5DBD37,"0");
					break;
				case 1:
//					_skin.rdo_type.label=LanguageConfig.getText(LangUI.UI_TEXT19);
					_skin.uiHead.styleName="ui/app/zhuangbei/jicheng/zuomo.png";
					_skin.labelDisplay.htmlText=LanguageConfig.getText(LangUI.UI_TEXT22)+HtmlTextUtil.getTextColor(0x5DBD37,"0");
					break;
				case 2:
//					_skin.rdo_type.label=LanguageConfig.getText(LangUI.UI_TEXT20);
					_skin.uiHead.styleName="ui/app/zhuangbei/jicheng/xilian.png";
					_skin.labelDisplay.htmlText="";
					break;
			}
			_skin.rdo_type.name=type.toString();
		}
		
		public function ShowAttribute(tragetInfo:EquipInfo,useInfo:EquipInfo):void
		{
			ClearAttribute();
			if(tragetInfo==null||useInfo==null)
			{			
				return;
			}
			while(_labContainer.numChildren){
				_labContainer.removeChildAt(0);
			}
			_labList.length=0;
			var lab:Label;
			switch(_type)
			{
				case 0://强化
					var tragetCfg:Q_equip_strength=EquipStrengthCfg.getStrengthCfg(tragetInfo.qItem.q_kind,tragetInfo.qItem.q_job,tragetInfo.strengthLevel);
					var useCfg:Q_equip_strength=EquipStrengthCfg.getStrengthCfg(useInfo.qItem.q_kind,useInfo.qItem.q_job,useInfo.strengthLevel);
					var attValues1:Q_att_values;
					var maps1:HashMap;
					var keys:Array;
					var values1:Array;
					attValues1=AttValueConfig.getAttInfoById(tragetCfg.q_att_type);
					maps1=AttValueConfig.getTypeValueMap(attValues1);
					values1=maps1.values();
					
					var attValues2:Q_att_values;
					var maps2:HashMap;
					var values2:Array;
					attValues2=AttValueConfig.getAttInfoById(useCfg.q_att_type);
					maps2=AttValueConfig.getTypeValueMap(attValues2);
					keys=maps2.keys();
					values2=maps2.values();
					var changV:*; 
					if(useInfo.strengthLevel>0&&values2!=null)
					{
						changV=useInfo.strengthLevel-tragetInfo.strengthLevel;
						changV=changV>0?"+"+changV:changV;
						_skin.labelDisplay.htmlText=LanguageConfig.getText(LangUI.UI_TEXT22)+HtmlTextUtil.getTextColor(StaticValue.A_UI_YELLOW_TEXT,tragetInfo.strengthLevel.toString())+HtmlTextUtil.getTextColor(0x5DBD37,"("+changV+")");
						for(var i:int=0;i<values2.length;i++)
						{
							if(i<values1.length&&values2[i]-values1[i]>0)
							{
								lab=new Label;
								lab.color = StaticValue.A_UI_GRAY_TEXT;
								lab.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
								lab.htmlText=CharAttributeType.getCNName(keys[i])+": "+HtmlTextUtil.getTextColor(StaticValue.A_UI_YELLOW_TEXT,values1[i])+HtmlTextUtil.getTextColor(0x5DBD37,"(+"+(values2[i]-values1[i])+")");
								_labList.push(lab);
								_labContainer.addChild(lab);
							}
							else
							{
								lab=new Label;
								lab.color = StaticValue.A_UI_GRAY_TEXT;
								lab.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
								lab.htmlText=CharAttributeType.getCNName(keys[i])+": "+HtmlTextUtil.getTextColor(StaticValue.A_UI_YELLOW_TEXT,"0")+HtmlTextUtil.getTextColor(0x5DBD37,"(+"+values2[i]+")");
								_labList.push(lab);
								_labContainer.addChild(lab);
							}
						}
						TouchableUtil.ungray(_skin.rdo_type);
						TouchableUtil.ungray(_skin.uiHead);
						TouchableUtil.ungray(_skin.labelDisplay);
						//						_skin.rdo_type.isEnabled=true;
					}
					else
					{
						_skin.labelDisplay.htmlText=LanguageConfig.getText(LangUI.UI_TEXT22)+HtmlTextUtil.getTextColor(StaticValue.A_UI_YELLOW_TEXT,tragetInfo.strengthLevel.toString());
						lab=new Label;
						lab.color = StaticValue.A_UI_RED_TEXT; //红色
						lab.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
						lab.htmlText=LanguageConfig.getText(LangUI.UI_TEXT23);
						_labList.push(lab);
						_labContainer.addChild(lab);
						TouchableUtil.gray(_skin.rdo_type);
						TouchableUtil.gray(_skin.uiHead);
						TouchableUtil.gray(_skin.labelDisplay);
						//						_skin.rdo_type.isEnabled=false;
					}
					break;
				case 1://琢磨
					var tragetPolishCfg:Q_equip_polish= EquipPolishCfg.getPolishCfg(tragetInfo.polishLevel);
					var usePolishCfg:Q_equip_polish = EquipPolishCfg.getPolishCfg(useInfo.polishLevel);
					if(tragetPolishCfg)
						var traget_Promote:int=tragetPolishCfg.q_promote;
					else traget_Promote=0;
					if(usePolishCfg)
						var use_Promote:int=usePolishCfg.q_promote;
					else
						use_Promote=0;
					var num:int=use_Promote-traget_Promote;
					if(num>0)
					{
						_skin.labelDisplay.htmlText=LanguageConfig.getText(LangUI.UI_TEXT21)+HtmlTextUtil.getTextColor(StaticValue.A_UI_YELLOW_TEXT,tragetInfo.polishLevel.toString())+HtmlTextUtil.getTextColor(0x5DBD37,"(+"+((useInfo.polishLevel-tragetInfo.polishLevel)+")"));
						lab=new Label;
						lab.color = StaticValue.A_UI_GRAY_TEXT;
						lab.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
						lab.htmlText=LanguageConfig.getText(LangUI.UI_TEXT24)+HtmlTextUtil.getTextColor(StaticValue.A_UI_YELLOW_TEXT,Number((traget_Promote/100).toFixed(1))+"%")+HtmlTextUtil.getTextColor(0x5DBD37,"(+"+Number((num/100).toFixed(1))+"%)");
						_labList.push(lab);
						_labContainer.addChild(lab);
						TouchableUtil.ungray(_skin.rdo_type);
						TouchableUtil.ungray(_skin.uiHead);
						TouchableUtil.ungray(_skin.labelDisplay);
						//						_skin.rdo_type.isEnabled=true;
					}
					else
					{
						_skin.labelDisplay.htmlText=LanguageConfig.getText(LangUI.UI_TEXT21)+HtmlTextUtil.getTextColor(StaticValue.A_UI_YELLOW_TEXT,tragetInfo.polishLevel.toString());
						lab=new Label;
						lab.color = StaticValue.A_UI_RED_TEXT;
						lab.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
						lab.htmlText=LanguageConfig.getText(LangUI.UI_TEXT25);
						_labList.push(lab);
						_labContainer.addChild(lab);
						TouchableUtil.gray(_skin.rdo_type);
						TouchableUtil.gray(_skin.uiHead);
						TouchableUtil.gray(_skin.labelDisplay);
						//						_skin.rdo_type.isEnabled=false;
					}
					break;
				case 2://洗炼
					var q_wash_attr:Q_equip_wash_attr;
					_skin.labelDisplay.htmlText="";
					if(useInfo.smeltAtt1!=0)
					{
						q_wash_attr=EquipWashAttCfg.getEquipWashAttr(useInfo.smeltAtt1);
						if(q_wash_attr.q_attr_id!=0)
						{
							attValues1=AttValueConfig.getAttInfoById(q_wash_attr.q_attr_id);
							maps1=AttValueConfig.getTypeValueMap(attValues1);
							keys=maps1.keys();
							values1=maps1.values();
							for(i=0;i<values1.length;i++)
							{
								lab=new Label;
								lab.color = StaticValue.A_UI_GRAY_TEXT;
								lab.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
								lab.htmlText=CharAttributeType.getCNName(keys[i])+":"+HtmlTextUtil.getTextColor(StaticValue.A_UI_YELLOW_TEXT,values1[i]);
								_labList.push(lab);
								_labContainer.addChild(lab);
							}
						}
						else if(q_wash_attr.q_buff_id!=0)
						{
							var q_buff:Q_buff=BuffStateDataManager.getData(q_wash_attr.q_buff_id);
							lab=new Label;
							lab.color = StaticValue.A_UI_GRAY_TEXT;
							lab.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
							lab.htmlText=q_buff.q_buff_name+":"+HtmlTextUtil.getTextColor(StaticValue.A_UI_YELLOW_TEXT,q_buff.q_description);
							_labList.push(lab);
							_labContainer.addChild(lab);
						}
						TouchableUtil.ungray(_skin.rdo_type);
						TouchableUtil.ungray(_skin.uiHead);
						TouchableUtil.ungray(_skin.labelDisplay);
						//						_skin.rdo_type.isEnabled=true;
					}
					if(useInfo.smeltAtt2!=0)
					{
						q_wash_attr=EquipWashAttCfg.getEquipWashAttr(useInfo.smeltAtt2);
						if(q_wash_attr.q_attr_id!=0)
						{
							attValues1=AttValueConfig.getAttInfoById(q_wash_attr.q_attr_id);
							maps1=AttValueConfig.getTypeValueMap(attValues1);
							keys=maps1.keys();
							values1=maps1.values();
							for(i=0;i<values1.length;i++)
							{
								lab=new Label;
								lab.color = StaticValue.A_UI_GRAY_TEXT;
								lab.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
								lab.htmlText=CharAttributeType.getCNName(keys[i])+":"+HtmlTextUtil.getTextColor(StaticValue.A_UI_YELLOW_TEXT,values1[i]);
								_labList.push(lab);
								_labContainer.addChild(lab);
							}
						}
						else if(q_wash_attr.q_buff_id!=0)
						{
							q_buff=BuffStateDataManager.getData(q_wash_attr.q_buff_id);
							lab=new Label;
							lab.color = StaticValue.A_UI_GRAY_TEXT;
							lab.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
							lab.htmlText=q_buff.q_buff_name+":"+HtmlTextUtil.getTextColor(StaticValue.A_UI_YELLOW_TEXT,q_buff.q_description);
							_labList.push(lab);
							_labContainer.addChild(lab);
						}
						TouchableUtil.ungray(_skin.rdo_type);
						TouchableUtil.ungray(_skin.uiHead);
						TouchableUtil.ungray(_skin.labelDisplay);
						//						_skin.rdo_type.isEnabled=true;
					}
					break;
			}
			shortList();
			_labContainer.x=120;
			_labContainer.y=35;
			this.addChild(_labContainer);
		}
		
		public function ClearAttribute():void
		{
			if(this.getChildIndex(_labContainer)!=-1)
				this.removeChild(_labContainer);
			if(_labContainer.numChildren>0) _labContainer.removeChildAt(0);
			_labList.length=0;
			switch(_type)
			{
				case 0:
					_skin.labelDisplay.htmlText=LanguageConfig.getText(LangUI.UI_TEXT22)+HtmlTextUtil.getTextColor(0x5DBD37,"0");
					break;
				case 1:
					_skin.labelDisplay.htmlText=LanguageConfig.getText(LangUI.UI_TEXT21)+HtmlTextUtil.getTextColor(0x5DBD37,"0");
					break;
				case 2:
					_skin.labelDisplay.htmlText="";
					break;
			}
			if(_skin.rdo_type.isSelected) _skin.rdo_type.isSelected=false;
			//			_skin.rdo_type.isEnabled=false;
			TouchableUtil.gray(_skin.rdo_type);
			TouchableUtil.gray(_skin.uiHead);
			TouchableUtil.gray(_skin.labelDisplay);
		}
		
		private function shortList():void
		{
			if(_labList==null||_labList.length<=0) return;
			switch(_type)
			{
				case 0:
					for(var i:int=0;i<_labList.length;i++)
					{
						_labList[i].x=(i%2)*(_labList[i].width+120)-90;
						_labList[i].y=int((i/2))*(_labList[i].height+10)-5;
					}
					break;
				case 1:
					for(i=0;i<_labList.length;i++)
					{
						_labList[i].x=-90;
						_labList[i].y=i*(_labList[i].height+10)-5;
					}
					break;
				case 2:
					for(i=0;i<_labList.length;i++)
					{
						_labList[i].x=(i%2)*(_labList[i].width+120)-90;
						_labList[i].y=int((i/2))*(_labList[i].height+10)-5;
					}
					break;
			}
		}
		
		public function set isSelect(bool:Boolean):void
		{
			_isSelect=bool;
		}
		
		public function get isSelect():Boolean
		{
			return _isSelect;
		}
	}
}