package com.rpgGame.appModule.common
{
	import com.rpgGame.app.display3D.UIAvatar3D;
	import com.rpgGame.netData.player.bean.PlayerAppearanceInfo;
	
	import starling.display.DisplayObjectContainer;

	/**
	 * 简要造型展示,根据AvatarView和AvatarManager改造
	 * @author yfl
	 * 
	 */	
	public class RoleModelShow extends UIAvatar3D
	{
		
		private var _data:PlayerAppearanceInfo;
		public function RoleModelShow(container:DisplayObjectContainer=null,scale:Number=1.0)
		{
			super(container,scale);
			
		}
		public function setData(appearanceInfo:PlayerAppearanceInfo,scaleRole:Number=1.0):void
		{
			_data=appearanceInfo;
			this.updateWithPlayerAppearanceInfo(_data);
			this.role.setScale(scaleRole);
		}
		public function get data():PlayerAppearanceInfo
		{
			return _data;
		}
		override public function dispose():void
		{
			_data=null;
			super.dispose();
		}

	}
}