package  com.rpgGame.app.manager.ctrl
{
	import com.rpgGame.app.scene.SceneRole;
	
	import gameEngine2D.IDispose;


	/**
	 * 场景对象功能组件控制器
	 * 因为是子控制器，无需单独实现池接口
	 * 为场景对象生，为场景对象死
	 * @author tyevlag
	 * 
	 */	
	public class SceneObjectControlBase implements IDispose
	{
		protected var _co:SceneRole = null;
		protected var _isDispose:Boolean = false;
		
		public function SceneObjectControlBase(tar:SceneRole)
		{
			_co = tar;
		}
		
		public function dispose():void
		{
			_isDispose = true;
		}
		
		public function get isDispose():Boolean
		{
			return _isDispose;
		}

		
	}
}