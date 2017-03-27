package com.rpgGame.appModule.systemset
{
	import com.rpgGame.app.manager.SystemSetManager;
	import com.rpgGame.app.richText.RichTextCustomUnitType;
	import com.rpgGame.app.richText.RichTextCustomUtil;
	import com.rpgGame.app.richText.component.RichTextArea3D;
	import com.rpgGame.app.richText.component.RichTextUnit;
	import com.rpgGame.app.richText.component.RichTextUnitData;
	
	import flash.events.TextEvent;
	
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.core.ToggleGroup;
	import feathers.data.ListCollection;
	
	import org.mokylin.skin.app.systemSet.guajiset_Skin;
	
	import starling.events.Event;

	public class HookSetingView extends BasePaneView
	{
		public function HookSetingView(content:SkinnableContainer):void
		{
			super(content);
		}
		private var _skin:guajiset_Skin;
		private var _group:ToggleGroup;
		
		override public function refeashView():void
		{
			super.refeashView();
			_skin = this._content.skin as guajiset_Skin;
			bindDate(_skin.chk_life,SystemSetManager.SYSTEMSET_LIFE);
			bindDate(_skin.chk_neili,SystemSetManager.SYSTEMSET_FORCE);
			bindDate(_skin.chk_yaoping,SystemSetManager.SYSTEMSET_AUOTBUYITEM);
			bindDate(_skin.chk_danyao,SystemSetManager.SYSTEMSET_AUOTUSEITEM);
			bindDate(_skin.chk_type,SystemSetManager.SYSTEMSET_AUOTATTACKPLAYER);
			bindDate(_skin.chk_zidong,SystemSetManager.SYSTEMSET_AUOT_GET_ITEM);
			bindDate(_skin.chk_fuhuo,SystemSetManager.SYSTEMSET_AUOT_USE_ITEM_ISDEAD);
			bindSliderAndInput(_skin.sld_life,_skin.input_life,SystemSetManager.SYSTEMSET_HP_PERCENT);
			bindSliderAndInput(_skin.sld_neili,_skin.input_neili,SystemSetManager.SYSTEMSET_FORCE_PERCENT);
			_group = new ToggleGroup();
			_skin.rdo_dingdian.toggleGroup = _group;
			_skin.rdo_dangqian.toggleGroup = _group;
			_skin.rdo_quantu.toggleGroup = _group;
			_group.selectedIndex = SystemSetManager.getinstance().getValueByIndex(SystemSetManager.SYSTEMSET_HOOK_TYPE);
			_group.addEventListener(Event.CHANGE,radioChangeHandler);
			
			var arr:Array =["1.5倍","2倍","3倍","4倍","5倍","6倍","7倍","8倍"];
			_skin.cmb_danyao.dataProvider = new ListCollection(arr);
			_skin.cmb_danyao.selectedIndex =SystemSetManager.getinstance().getValueByIndex(SystemSetManager.SYSTEMSET_USEITEM_PERCENT);
			_skin.cmb_danyao.addEventListener(Event.CHANGE,comboboxChangehandler);
			ItemGetPaneView.GetInstance().bindDisplay = _skin.lb_zidongshiqu;
		}
		
	
		private function comboboxChangehandler(e:Event):void
		{
			SystemSetManager.getinstance().setValueByIndex(SystemSetManager.SYSTEMSET_USEITEM_PERCENT,_skin.cmb_danyao.selectedIndex);
		}
		private function radioChangeHandler(evt:Event):void
		{
			SystemSetManager.getinstance().setValueByIndex(SystemSetManager.SYSTEMSET_HOOK_TYPE,_group.selectedIndex);
		}
	}
}