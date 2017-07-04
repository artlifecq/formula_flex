package com.rpgGame.appModule.mount
{
	import com.rpgGame.app.fight.spell.NumberChangeEffect;
	import com.rpgGame.app.manager.mount.MountShowData;
	import com.rpgGame.app.utils.FightValueUtil;
	
	import org.mokylin.skin.app.zuoqi.Shuxing_Item;
	import org.mokylin.skin.app.zuoqi.ZuoqiCont_Skin;

	public class MountProps
	{
		private var _currentPower:int;
		private var _nextPower:int;
		private var _propList:Vector.<MountPropView>;
		private var _skin:ZuoqiCont_Skin;
		private var _mountShowData:MountShowData;
		private var _numbereffect:NumberChangeEffect;
		public function MountProps(skin:ZuoqiCont_Skin):void
		{
			_skin = skin;
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
			_numbereffect = new NumberChangeEffect(_skin.NumZhanli);
		}
		
		private var _isSHowNext:Boolean = true;
		public function refeashPropShow(bool:Boolean):void
		{
			_isSHowNext = bool;
			var level:int = _mountShowData.mountLevel;
			if(!bool)
				level -=1;
			_skin.mc_name.gotoAndStop(level);
			_skin.mc_jieshu.gotoAndStop(level);
			for each(var view:MountPropView in _propList)
			{
				view.showUpLevelView(bool);
			}
			
			if(bool)
			{
				_numbereffect.updateValue(_currentPower,_nextPower);
				_numbereffect.runEffect();
			}else{
				_numbereffect.updateValue(_nextPower,_currentPower);
				_numbereffect.runEffect();
			}
		}
		private var _foundIndex:int;
		private var _currentProp:Vector.<Number>;
		private var _addProp:Vector.<Number>;
		private var _disProps:Vector.<Number>;
		public function refeashPropValue():void
		{
			_currentProp = _mountShowData.currentProp(_currentProp);
			_addProp = _mountShowData.addProps(_addProp);
			_currentPower = FightValueUtil.calAtrributeFightPower(_currentProp.concat(),_mountShowData.heroJob);
			if(_addProp!=null)
			{
				_nextPower = FightValueUtil.calAtrributeFightPower(_mountShowData.nextProps,_mountShowData.heroJob);
			}else{
				_nextPower = 0;
			}
			_nextPower = Math.floor(_currentPower+_nextPower*_mountShowData.percent);
			_numbereffect.updateValue(_currentPower,_nextPower);
			_foundIndex = 0;
			_disProps = _mountShowData.disProps;
			for each(var view:MountPropView in _propList)
			{
				var nextType:int = nextPropIndex();
				if(_addProp!=null&&_addProp.length >0)
					view.updataAtt(nextType,_currentProp[nextType],_addProp[nextType],_disProps[nextType],_mountShowData.heroJob);
				else
					view.updataAtt(nextType,_currentProp[nextType],0,_disProps[nextType],_mountShowData.heroJob);
			}
		}
		public function nextPropIndex():int
		{
			if(_foundIndex>=_currentProp.length)
				return 0;
			for(_foundIndex++;_foundIndex<_currentProp.length;_foundIndex++)
			{
				if(_currentProp[_foundIndex]!=0||_disProps[_foundIndex]!=0)
					return _foundIndex;
			}
			return 0;
		}
		public function updataInfo(mountShowData:MountShowData):void
		{
			_mountShowData = mountShowData;
			refeashPropValue();
		}
	}
}