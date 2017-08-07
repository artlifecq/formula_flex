package com.rpgGame.appModule.pet
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.clientConfig.Q_girl_pet;
	import com.rpgGame.netData.pet.bean.PetInfo;
	
	import feathers.utils.filter.GrayFilter;
	
	import org.mokylin.skin.app.meiren.MeiRen_Head;
	
	import starling.display.DisplayObject;
	
	public class PetHeadItemExt extends SkinUI
	{
		public static var clickMe:Function;
		private var _skin:MeiRen_Head;
		private var _config:Q_girl_pet;
		private var _data:PetInfo;
		public function PetHeadItemExt(config:Q_girl_pet)
		{
			_skin=new MeiRen_Head();
			super(_skin);
			this._config=config;
			_skin.uiZhan.visible=false;
			_skin.uiSelect.visible=false;
			_skin.icon.styleName="ui/mainui/meirenHead/head_icon/head"+_config.q_id+"s.png";
			_skin.uiName.styleName="ui/mainui/meirenHead/head_icon/name"+_config.q_id+"s.png";
		}
		public function setServerData(data:PetInfo):void
		{
			this._data=data;
			if (data.actived>0) 
			{
				GrayFilter.unGray(_skin.icon);
			}
			else
			{
				GrayFilter.gray(_skin.icon);
			}
			updateIsChuZhan();
		}
		
		public function updateIsChuZhan():void
		{
			_skin.uiZhan.visible=Mgr.petMgr.curPetId==_data.modelId;
		}
		
		public function setSelect(value:Boolean):void
		{
			_skin.uiSelect.visible=value;
		}
		public function get data():PetInfo
		{
			return _data;
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if (clickMe) 
			{
				clickMe(this);
			}
		}
		public function get config():Q_girl_pet
		{
			return _config;
		}
	}
}