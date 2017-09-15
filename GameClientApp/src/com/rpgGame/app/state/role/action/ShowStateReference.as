package com.rpgGame.app.state.role.action
{
	import com.game.engine3D.state.StateReference;
	import com.rpgGame.app.display3D.UIAvatar3D;
	
	/**
	 * 展示状态引用
	 * @author dik
	 * 
	 */
	public class ShowStateReference extends StateReference
	{
		public var avatar3d:UIAvatar3D;
		
		public function ShowStateReference()
		{
			super();
		}
	}
}