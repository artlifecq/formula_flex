package com.rpgGame.appModule.mount
{
	import com.rpgGame.app.manager.mount.MountShowData;
	import com.rpgGame.app.manager.mount.ZhanQiShowData;
	import com.rpgGame.app.utils.FightValueUtil;
	
	import org.mokylin.skin.app.zuoqi.Shuxing_Item;
	import org.mokylin.skin.app.zuoqi.Zhanqi_Skin;
	
	public class ZhanQiProps
	{
		private var _skin:Zhanqi_Skin;
		
		private var _currentPower:int;
		private var _nextPower:int;
		private var _propList:Vector.<MountPropView>;
		private var _zhanqiShowData:ZhanQiShowData;
		public function ZhanQiProps(skin:Zhanqi_Skin)
		{
			_skin=skin;
			super();
			initView();
		}
		
		private function initView():void
		{
			_propList = new Vector.<MountPropView>();
			_propList.push(new MountPropView(_skin.lab_1.skin as Shuxing_Item,1));
			_propList.push(new MountPropView(_skin.lab_2.skin as Shuxing_Item,2));
			_propList.push(new MountPropView(_skin.lab_3.skin as Shuxing_Item,3));
			_propList.push(new MountPropView(_skin.lab_4.skin as Shuxing_Item,4));
			_propList.push(new MountPropView(_skin.lab_5.skin as Shuxing_Item,5));
			_propList.push(new MountPropView(_skin.lab_6.skin as Shuxing_Item,6));
			_propList.push(new MountPropView(_skin.lab_7.skin as Shuxing_Item,7));
			_propList.push(new MountPropView(_skin.lab_8.skin as Shuxing_Item,8));
		}
		
		private var _isSHowNext:Boolean = true;
		public function refeashPropShow(bool:Boolean):void
		{
			_isSHowNext = bool;
			var level:int = _zhanqiShowData.zhanqiLevel;
			if(!bool)
				level -=1;
			_skin.mc_name.gotoAndStop(level);
			_skin.mc_jieshu.gotoAndStop(level);
			for each(var view:MountPropView in _propList)
			{
				view.showUpLevelView(bool);
			}
		}
		private var _foundIndex:int;
		private var _currentProp:Vector.<Number>;
		private var _addProp:Vector.<Number>;
		private var _disProps:Vector.<Number>;
		public function refeashPropValue():void
		{
			_currentProp = _zhanqiShowData.currentProp(_currentProp);
			_addProp = _zhanqiShowData.addProps(_addProp);
			_currentPower = FightValueUtil.calAtrributeFightPower(_currentProp.concat(),_zhanqiShowData.zhanqiJob);
			if(_addProp!=null)
			{
				_nextPower = FightValueUtil.calAtrributeFightPower(_addProp.concat(),_zhanqiShowData.zhanqiJob);
			}else{
				_nextPower = 0;
			}
			_skin.NumZhanli.number = Math.floor(_currentPower+_nextPower*_zhanqiShowData.percent);
			_foundIndex = 0;
			_disProps = _zhanqiShowData.disProps;
			for each(var view:MountPropView in _propList)
			{
				if(_addProp!=null&&_addProp.length >0)
					view.updataAtt(_currentProp,_addProp,_disProps,_zhanqiShowData.zhanqiJob);
				else
					view.updataAtt(_currentProp,null,_disProps,_zhanqiShowData.zhanqiJob);
			}
		}
		
	
		
		public function updataInfo(zhanqiShowData:ZhanQiShowData):void
		{
			_zhanqiShowData = zhanqiShowData;
			refeashPropValue();
		}
	}
}
