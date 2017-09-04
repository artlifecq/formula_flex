package com.rpgGame.appModule.systemset
{
	import com.rpgGame.app.manager.SystemSetManager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.appModule.common.itemRender.SkinItem;
	import com.rpgGame.appModule.common.itemRender.SkinItemRender;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	
	import away3d.events.Event;
	
	import feathers.controls.List;
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.Scroller;
	import feathers.controls.Slider;
	import feathers.data.ListCollection;
	import feathers.events.FeathersEventType;
	
	import org.mokylin.skin.app.systemSet.guajiset_Skin;
	import org.mokylin.skin.common.subItem_Skin;
	
	import starling.display.DisplayObject;
	
	public class HookSetingView extends SkinUI
	{
		/**生命值按钮选中*/
		private var _hpSelect:Boolean=false;
		/**生命值百分比*/
		private var _hpValue:int=85;
		/**自动购买按钮选中*/
		private var _lifeSelect:Boolean=false;
		/**攻击距离*/
		private var _hookValue:int=10;
		/**自动拾取所有按钮选中（与拾取互斥）*/
		private var _autoSelect:Boolean=false;
		/**拾取按钮选中（与自动拾取互斥）*/
		private var _pickUpSelect:Boolean=false;
		/**拾取职业*/
		private var _job:int=0;
		/**拾取品质*/
		private var _quality:int=0;
		/**自动原地复活*/
		private var _autoResurrection:Boolean=false;
		
		
		public var _skin:guajiset_Skin;
		private var _zhiyearr:Array;
		private var _dengjiearr:Array;
		private var _pinzhiarr:Array =["全部品质","绿色","蓝色","紫色","金色"];
		public function HookSetingView():void
		{
			_skin =new guajiset_Skin();
			super(_skin);
			_zhiyearr = new Array();
			_zhiyearr=["全部职业","兵家","墨家","医家"];
			_dengjiearr = new Array();
			_dengjiearr = ["全部等阶","大于一阶","大于二阶","大于三阶","大于四阶","大于五阶","大于六阶","大于七阶","大于八阶","大于九阶"];
			addEvent();
			_skin.cmb_zhiye.addEventListener(FeathersEventType.CREATION_COMPLETE,onCreateJob);			
			_skin.cmb_dengjie.addEventListener(FeathersEventType.CREATION_COMPLETE,onCreateLv);
		}
		
		private function initView():void
		{
			_hpSelect=SystemSetManager.hpSelect;
			_hpValue=SystemSetManager.hpValue;
			_lifeSelect=SystemSetManager.lifeSelect;
			_hookValue=SystemSetManager.hookValue;
			_autoSelect=SystemSetManager.autoSelect;
			_pickUpSelect=SystemSetManager.pickUpSelect;
			_job=SystemSetManager.job;
			_quality=SystemSetManager.quality;
			_autoResurrection=SystemSetManager.autoResurrection;
			
			_skin.chk_life.isSelected=_hpSelect;	
			_skin.sld_life.maximum=100;
			_skin.sld_life.minimum=0;
			_skin.sld_life.value=_hpValue;
			_skin.input_life.text=_hpValue.toString();
			_skin.chk_yaoping.isSelected=_lifeSelect;				
			_skin.chk_type.isSelected=_autoSelect;
			_skin.chk_shiqu.isSelected=_pickUpSelect;
			_skin.chk_yaopin.isSelected=_autoResurrection;
			_skin.cmb_zhiye.selectedIndex=_job;
			_skin.cmb_dengjie.selectedIndex=_quality;
			
			updateShowNum();			
		}
		
		override protected function  onShow():void
		{
			super.onShow();
			initView();
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
			_skin.cmb_zhiye.selectedIndex=_job;
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
			_skin.cmb_dengjie.selectedIndex=_quality;
		}
		
		private function createComBoxRender_Job():SkinItemRender
		{
			var skin:subItem_Skin=new subItem_Skin();
			var skinItem:SkinItem=new SkinItem(_skin.cmb_zhiye,skin);
			skinItem.callBack=zhiyeChangehandler;
			var render:SkinItemRender=new SkinItemRender(skinItem);
			return render;
		}
		
		private function createComBoxRender_Lv():SkinItemRender
		{
			var skin:subItem_Skin=new subItem_Skin();
			var skinItem:SkinItem=new SkinItem(_skin.cmb_dengjie,skin);
			skinItem.callBack=dengjieChangehandler;
			var render:SkinItemRender=new SkinItemRender(skinItem);
			return render;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.chk_life:
				{
					_hpSelect=_skin.chk_life.isSelected;
					break;
				}
				case _skin.chk_yaoping:
				{
					_lifeSelect=_skin.chk_yaoping.isSelected;
					break;
				}
				case _skin.chk_type:
				{
					_autoSelect=_skin.chk_type.isSelected;
					break;
				}
				case _skin.chk_shiqu:
				{
					_pickUpSelect=_skin.chk_shiqu.isSelected;
					break;
				}
				case _skin.chk_yaopin:
				{
					_autoResurrection=_skin.chk_yaopin.isSelected;
					break;
				}
				case _skin.btn_ok:
				{
					saveDataHandler();
					break;
				}
				case _skin.btn_start:
				{
					starAuto();
					break;
				}
			}
		}
		
		private function addEvent():void
		{
			_skin.btn_min.addEventListener(Event.TRIGGERED,btnminHandler);
			_skin.btn_max.addEventListener(Event.TRIGGERED,btnmaxHandler);
			_skin.sld_life.addEventListener(Event.CHANGE,changeHandler);
		}
		/**范围减*/
		private function btnminHandler(e:Event):void
		{
			if(_hookValue>5)
			{
				_hookValue-=5;
				if(_hookValue<5)
				{
					_hookValue=5;
				}
				updateShowNum();
			}
		}
		
		/**范围加*/
		private function btnmaxHandler(e:Event):void
		{
			if(_hookValue<20)
			{
				_hookValue+=5;
				if(_hookValue>20)
				{
					_hookValue=20;
				}
				updateShowNum();
			}		
		}
		
		private function changeHandler(e:Event):void
		{
			if(e.target == _skin.sld_life)	{
				_hpValue=(e.target as Slider).value;
				_skin.input_life.text=_hpValue.toString();
			}
		}
		
		private function updateShowNum():void
		{
			_skin.input_txt.text=_hookValue.toString();
		}
		
		private function zhiyeChangehandler():void
		{
			_job=_skin.cmb_zhiye.selectedIndex;
		}
		
		private function dengjieChangehandler():void
		{
			_quality=_skin.cmb_dengjie.selectedIndex;
		}	
		
		private function saveDataHandler():void
		{
			SystemSetManager.hpSelect=_hpSelect;
			SystemSetManager.hpValue=_hpValue;
			SystemSetManager.lifeSelect=_lifeSelect;
			SystemSetManager.hookValue=_hookValue;
			SystemSetManager.autoSelect=_autoSelect;
			SystemSetManager.pickUpSelect=_pickUpSelect;
			SystemSetManager.job=_job;
			SystemSetManager.quality=_quality;
			SystemSetManager.autoResurrection=_autoResurrection;
			SystemSetManager.saveData();
		}
		
		private function starAuto():void
		{
			if (!TrusteeshipManager.getInstance().isAutoFightRunning)
			{
				TrusteeshipManager.getInstance().startAutoFight();
			}
		}
		
		override protected  function onHide():void
		{
			super.onHide();
		}
	}
}