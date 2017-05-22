package com.rpgGame.appModule.systemset
{
	import com.rpgGame.app.manager.SystemSetManager;
	import com.rpgGame.app.richText.RichTextCustomUnitType;
	import com.rpgGame.app.richText.RichTextCustomUtil;
	import com.rpgGame.app.richText.component.RichTextArea3D;
	import com.rpgGame.app.richText.component.RichTextUnit;
	import com.rpgGame.app.richText.component.RichTextUnitData;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	
	import away3d.events.MouseEvent3D;
	
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.core.ToggleGroup;
	import feathers.data.ListCollection;
	
	import org.mokylin.skin.app.systemSet.guajiset_Skin;
	
	import away3d.events.Event;

	public class HookSetingView extends BasePaneView
	{
		public function HookSetingView(content:SkinnableContainer):void
		{
			super(content);
		}
		public var _skin:guajiset_Skin;
		private var _areaNum:int=10;
		override public function refeashView():void
		{
			super.refeashView();
			_skin = this._content.skin as guajiset_Skin;
			bindDate(_skin.chk_life,SystemSetManager.SYSTEMSET_LIFE);
			bindDate(_skin.chk_yaoping,SystemSetManager.SYSTEMSET_AUOTBUYITEM);
			bindDate(_skin.chk_danyao,SystemSetManager.SYSTEMSET_AUOTUSEITEM);
			bindDate(_skin.chk_type,SystemSetManager.SYSTEMSET_AUOT_USE_ITEM_ISDEAD);
			bindDate(_skin.chk_shiqu,SystemSetManager.SYSTEMSET_AUOT_GET_EQUIPMENT);
			bindDate(_skin.chk_yaopin,SystemSetManager.SYSTEMSET_AUOT_GET_DRUGS);
			bindDate(_skin.chk_yinliang,SystemSetManager.SYSTEMSET_AUOT_GET_MONEY);
			bindDate(_skin.chk_cailiao,SystemSetManager.SYSTEMSET_AUOT_GET_MATERIAL);
			bindSliderAndInput(_skin.sld_life,_skin.input_life,SystemSetManager.SYSTEMSET_HP_PERCENT);
			//_skin.sld_life.value=30;
			//bindDate(_skin.chk_zidong,SystemSetManager.SYSTEMSET_AUOT_GET_ITEM);
			//bindDate(_skin.chk_fuhuo,SystemSetManager.SYSTEMSET_AUOT_USE_ITEM_ISDEAD);
			
			//bindSliderAndInput(_skin.sld_neili,_skin.input_neili,SystemSetManager.SYSTEMSET_FORCE_PERCENT);
			//_group = new ToggleGroup();
			//_skin.rdo_dingdian.toggleGroup = _group;
			//_skin.rdo_dangqian.toggleGroup = _group;
			//_skin.rdo_quantu.toggleGroup = _group;
			//_group.selectedIndex = SystemSetManager.getinstance().getValueByIndex(SystemSetManager.SYSTEMSET_HOOK_TYPE);
			//_group.addEventListener(Event.CHANGE,radioChangeHandler);
			//ItemGetPaneView.GetInstance().bindDisplay = _skin.lb_zidongshiqu;
			
			//SystemSetManager.getinstance().getValueByIndex();
			
			var danyaoarr:Array =["1.5倍","2倍","3倍","4倍","5倍","6倍","7倍","8倍"];
			_skin.cmb_danyao.dataProvider = new ListCollection(danyaoarr);
			_skin.cmb_danyao.selectedIndex =SystemSetManager.getinstance().getValueByIndex(SystemSetManager.SYSTEMSET_USEITEM_PERCENT);
			_skin.cmb_danyao.addEventListener(Event.CHANGE,comboboxChangehandler);
			
			var zhiyearr:Array =["全部职业","兵家","墨家","医家"];
			var dengjiearr:Array =["全部等阶","大于一阶","大于二阶","大于三阶","大于四阶","大于五阶","大于六阶","大于七阶","大于八阶","大于九阶"];
			var pinzhiarr:Array =["全部品质","绿色","蓝色","紫色","金色"];
			_skin.cmb_zhiye.dataProvider = new ListCollection(zhiyearr);
			_skin.cmb_zhiye.selectedIndex =SystemSetManager.getinstance().getValueByIndex(SystemSetManager.SYSTEMSET_AUOT_GET_ZHIYE);
			_skin.cmb_zhiye.addEventListener(Event.CHANGE,zhiyeChangehandler);
			
			_skin.cmb_dengjie.dataProvider = new ListCollection(dengjiearr);
			_skin.cmb_dengjie.selectedIndex =SystemSetManager.getinstance().getValueByIndex(SystemSetManager.SYSTEMSET_AUOT_GET_DENGJIE);
			_skin.cmb_dengjie.addEventListener(Event.CHANGE,dengjieChangehandler);
			
			_skin.cmb_pinzhi.dataProvider = new ListCollection(pinzhiarr);
			_skin.cmb_pinzhi.selectedIndex =SystemSetManager.getinstance().getValueByIndex(SystemSetManager.SYSTEMSET_AUOT_GET_PINZHI);
			_skin.cmb_pinzhi.addEventListener(Event.CHANGE,pinzhiChangehandler);
			_areaNum=SystemSetManager.getinstance().getValueByIndex(SystemSetManager.SYSTEMSET_HOOK_TYPE);
			addEvent();
			updateShowNum();
			
			//_skin.btn_start.addEventListener(MouseEvent.CLICK,startClick);
			
		}
		private function addEvent():void
		{
			_skin.btn_min.addEventListener(Event.TRIGGERED,btnminHandler);
			_skin.btn_max.addEventListener(Event.TRIGGERED,btnmaxHandler);
		}
		/**范围减*/
		private function btnminHandler(e:Event):void
		{
			if(_areaNum>5)
			{
				_areaNum-=5;
				if(_areaNum<5)
				{
					_areaNum=5;
				}
				updateShowNum();
			}
		}
		
		/**范围加*/
		private function btnmaxHandler(e:Event):void
		{
			if(_areaNum<20)
			{
				_areaNum+=5;
				if(_areaNum>20)
				{
					_areaNum=20;
				}
				updateShowNum();
			}		
		}
		private function updateShowNum():void
		{
			_skin.input_txt.text=_areaNum.toString();
			radioChangeHandler();
		}
		private function radioChangeHandler():void
		{
			SystemSetManager.getinstance().setValueByIndex(SystemSetManager.SYSTEMSET_HOOK_TYPE,_areaNum);
		}
		private function comboboxChangehandler(e:Event):void
		{
			SystemSetManager.getinstance().setValueByIndex(SystemSetManager.SYSTEMSET_USEITEM_PERCENT,_skin.cmb_danyao.selectedIndex);
		}
		
		private function zhiyeChangehandler(e:Event):void
		{
			SystemSetManager.getinstance().setValueByIndex(SystemSetManager.SYSTEMSET_AUOT_GET_ZHIYE,_skin.cmb_zhiye.selectedIndex);
		}
		private function dengjieChangehandler(e:Event):void
		{
			SystemSetManager.getinstance().setValueByIndex(SystemSetManager.SYSTEMSET_AUOT_GET_DENGJIE,_skin.cmb_dengjie.selectedIndex);
		}
		private function pinzhiChangehandler(e:Event):void
		{
			SystemSetManager.getinstance().setValueByIndex(SystemSetManager.SYSTEMSET_AUOT_GET_PINZHI,_skin.cmb_pinzhi.selectedIndex);
		}
		
		
		
	}
}