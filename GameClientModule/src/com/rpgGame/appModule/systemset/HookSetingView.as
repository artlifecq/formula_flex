package com.rpgGame.appModule.systemset
{
	import com.rpgGame.app.manager.SystemSetManager;
	import com.rpgGame.appModule.common.itemRender.SkinItem;
	import com.rpgGame.appModule.common.itemRender.SkinItemRender;
	
	import away3d.events.Event;
	
	import feathers.controls.List;
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.Scroller;
	import feathers.controls.SkinnableContainer;
	import feathers.data.ListCollection;
	import feathers.events.FeathersEventType;
	
	import org.mokylin.skin.app.systemSet.guajiset_Skin;
	import org.mokylin.skin.common.subItem_Skin;
	
	public class HookSetingView extends BasePaneView
	{
		public function HookSetingView(content:SkinnableContainer):void
		{
			super(content);
		}
		public var _skin:guajiset_Skin;
		private var _areaNum:int=10;
		private var _zhiyearr:Array;
		private var _dengjiearr:Array;
		private var _pinzhiarr:Array =["全部品质","绿色","蓝色","紫色","金色"];
		override public function refeashView():void
		{
			super.refeashView();
			_skin = this._content.skin as guajiset_Skin;
			_zhiyearr = new Array();
			_zhiyearr=["全部职业","兵家","墨家","医家"];
			 _dengjiearr = new Array();
			 _dengjiearr = ["全部等阶","大于一阶","大于二阶","大于三阶","大于四阶","大于五阶","大于六阶","大于七阶","大于八阶","大于九阶"];
			bindDate(_skin.chk_life,SystemSetManager.SYSTEMSET_LIFE);
			bindDate(_skin.chk_yaoping,SystemSetManager.SYSTEMSET_AUOTBUYITEM);
			//			bindDate(_skin.chk_danyao,SystemSetManager.SYSTEMSET_AUOTUSEITEM);
			bindDate(_skin.chk_type,SystemSetManager.SYSTEMSET_AUOT_USE_ITEM_ISDEAD);
			bindDate(_skin.chk_shiqu,SystemSetManager.SYSTEMSET_AUOT_GET_EQUIPMENT);
			bindDate(_skin.chk_yaopin,SystemSetManager.SYSTEMSET_AUOT_GET_DRUGS);
			//			bindDate(_skin.chk_yinliang,SystemSetManager.SYSTEMSET_AUOT_GET_MONEY);
			//			bindDate(_skin.chk_cailiao,SystemSetManager.SYSTEMSET_AUOT_GET_MATERIAL);
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
			//			_skin.cmb_danyao.dataProvider = new ListCollection(danyaoarr);
			//			_skin.cmb_danyao.selectedIndex =SystemSetManager.getinstance().getValueByIndex(SystemSetManager.SYSTEMSET_USEITEM_PERCENT);
			//			_skin.cmb_danyao.addEventListener(Event.CHANGE,comboboxChangehandler);
			_skin.cmb_zhiye.addEventListener(FeathersEventType.CREATION_COMPLETE,onCreateJob);
			//			_skin.cmb_zhiye.alpha=0;
			
			_skin.cmb_dengjie.addEventListener(FeathersEventType.CREATION_COMPLETE,onCreateLv);
			//			_skin.cmb_dengjie.alpha=0;
			//			_skin.cmb_zhiye.dataProvider = new ListCollection(zhiyearr);
			//			_skin.cmb_zhiye.selectedIndex =SystemSetManager.getinstance().getValueByIndex(SystemSetManager.SYSTEMSET_AUOT_GET_ZHIYE);
			//			_skin.cmb_zhiye.addEventListener(Event.CHANGE,zhiyeChangehandler);
			//			
			//			_skin.cmb_dengjie.dataProvider = new ListCollection(dengjiearr);
			//			_skin.cmb_dengjie.selectedIndex =SystemSetManager.getinstance().getValueByIndex(SystemSetManager.SYSTEMSET_AUOT_GET_DENGJIE);
			//			_skin.cmb_dengjie.addEventListener(Event.CHANGE,dengjieChangehandler);
			
			//			_skin.cmb_pinzhi.dataProvider = new ListCollection(pinzhiarr);
			//			_skin.cmb_pinzhi.selectedIndex =SystemSetManager.getinstance().getValueByIndex(SystemSetManager.SYSTEMSET_AUOT_GET_PINZHI);
			//			_skin.cmb_pinzhi.addEventListener(Event.CHANGE,pinzhiChangehandler);
			_areaNum=SystemSetManager.getinstance().getValueByIndex(SystemSetManager.SYSTEMSET_HOOK_TYPE);
			addEvent();
			updateShowNum();
			
			//_skin.btn_start.addEventListener(MouseEvent.CLICK,startClick);		
		}
		
		private function onCreateJob(e:Event):void
		{
			_skin.cmb_zhiye.removeEventListener(FeathersEventType.CREATION_COMPLETE,onCreateJob);
			var list:List=_skin.cmb_zhiye.getList();
			list.itemRendererFactory = createComBoxRender_Job;
			list.clipContent = true;
			list.scrollBarDisplayMode = ScrollBarDisplayMode.ALWAYS_VISIBLE;
			list.verticalScrollBarPosition = "right";
			list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			list.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			list.padding=2;
			_skin.cmb_zhiye.dataProvider=new ListCollection(_zhiyearr);
			_skin.cmb_zhiye.selectedIndex=0;
		}
		
		private function onCreateLv(e:Event):void
		{
			_skin.cmb_dengjie.removeEventListener(FeathersEventType.CREATION_COMPLETE,onCreateLv);
			var list:List=_skin.cmb_dengjie.getList();
			list.itemRendererFactory = createComBoxRender_Lv;
			list.clipContent = true;
			list.scrollBarDisplayMode = ScrollBarDisplayMode.ALWAYS_VISIBLE;
			list.verticalScrollBarPosition = "right";
			list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			list.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			list.padding=2;	
			_skin.cmb_dengjie.dataProvider=new ListCollection(_dengjiearr);
			_skin.cmb_dengjie.selectedIndex=0;
		}
		
		private function createComBoxRender_Job():SkinItemRender
		{
			var skin:subItem_Skin=new subItem_Skin();
			var skinItem:SkinItem=new SkinItem(_skin.cmb_zhiye,skin);
			var render:SkinItemRender=new SkinItemRender(skinItem);
			return render;
		}
		
		private function createComBoxRender_Lv():SkinItemRender
		{
			var skin:subItem_Skin=new subItem_Skin();
			var skinItem:SkinItem=new SkinItem(_skin.cmb_dengjie,skin);
			var render:SkinItemRender=new SkinItemRender(skinItem);
			return render;
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
			//			SystemSetManager.getinstance().setValueByIndex(SystemSetManager.SYSTEMSET_USEITEM_PERCENT,_skin.cmb_danyao.selectedIndex);
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
			//			SystemSetManager.getinstance().setValueByIndex(SystemSetManager.SYSTEMSET_AUOT_GET_PINZHI,_skin.cmb_pinzhi.selectedIndex);
		}
		
		
		
	}
}