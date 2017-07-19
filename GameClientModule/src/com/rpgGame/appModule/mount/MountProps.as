package com.rpgGame.appModule.mount
{
	import com.game.engine2D.config.staticdata.CharAngleType;
	import com.rpgGame.app.fight.spell.NumberChangeEffect;
	import com.rpgGame.app.manager.mount.MountShowData;
	import com.rpgGame.app.utils.FightValueUtil;
	import com.rpgGame.coreData.type.CharAttributeType;
	
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
			_propList.push(new MountPropView(_skin.lab_1.skin as Shuxing_Item,CharAttributeType.WAI_GONG));
			_propList.push(new MountPropView(_skin.lab_2.skin as Shuxing_Item,CharAttributeType.SHENFA));
			_propList.push(new MountPropView(_skin.lab_3.skin as Shuxing_Item,CharAttributeType.MAX_HP));
			_propList.push(new MountPropView(_skin.lab_4.skin as Shuxing_Item,CharAttributeType.DEFENSE_PER));
			_propList.push(new MountPropView(_skin.lab_5.skin as Shuxing_Item,CharAttributeType.HIT));
			_numbereffect = new NumberChangeEffect(_skin.NumZhanli);
			_skin.num_lv.visible = false;
			_skin.ico_up.visible = false;
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
			
			/*if(bool)
			{
				_numbereffect.updateValue(_currentPower,_nextPower);
				_numbereffect.runEffect();
			}else{
				_numbereffect.updateValue(_nextPower,_currentPower);
				_numbereffect.runEffect();
			}*/
			_skin.num_lv.visible = bool;
			_skin.ico_up.visible = bool;
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
			
			_disProps = _mountShowData.disProps;
			if(_disProps!=null)
			{
				_nextPower = FightValueUtil.calAtrributeFightPower(_disProps.concat(),_mountShowData.heroJob);
			}else{
				_nextPower = 0;
			}
			_skin.num_lv.number = _nextPower - _currentPower;
			_numbereffect.updateValue(_currentPower,_nextPower);
			_foundIndex = 0;
			
			for each(var view:MountPropView in _propList)
			{
				if(_addProp!=null&&_addProp.length >0)
					view.updataAtt(_currentProp,_addProp,_disProps,_mountShowData.heroJob);
				else
					view.updataAtt(_currentProp,null,_disProps,_mountShowData.heroJob);
			}
		}
	
		public function updataInfo(mountShowData:MountShowData):void
		{
			_mountShowData = mountShowData;
			refeashPropValue();
		}
	}
}