package com.game.engine2D.scene.layers
{
	import com.game.engine2D.scene.SceneCamera;
	import com.game.engine2D.utils.SceneUtil;
	import com.game.engine2D.vo.BaseObj;
	import com.game.engine2D.vo.PoolContainer;
	import com.game.mainCore.libCore.log.ZLog;
	
	import away3d.containers.ObjectContainer3D;
	
	import gs.TweenLite;
	
	/**
	 * @private
	 * 角色换装层 (此类支持向外部渲染，比如界面上显示动态的角色换装)
	 * @author Carver
	 */
	public class SceneRenderLayer extends PoolContainer
	{
		private var _sceneCamera:SceneCamera;
		private var _baseObjList:Vector.<BaseObj> = new Vector.<BaseObj>;
		
		public function SceneRenderLayer(sceneCamera:SceneCamera)
		{
			_sceneCamera = sceneCamera;
		}
		
		/**
		 * @private
		 * 场景所有角色集合
		 */
		public function Debnug_call_GetBaseObjList():Vector.<BaseObj>
		{
			return _baseObjList;
		}
		
		public function get baseObjCnt():uint
		{
			return _baseObjList.length;
		}
		
		/**
		 * 清空
		 */
		override public function dispose():void
		{
			//角色
			//------------------------------------
			//移除所有角色，但不移除主角 和 鼠标点击效果虚拟角色,主要是回收操作！！！
			var len:int = _baseObjList.length;
			while(len-->0)
			{
				var bo:BaseObj = _baseObjList[len];
				removeBaseObj(bo);
			}
		}
		
		/**
		 * 运行
		 */
		final public function run():void
		{		
			//运行角色可复写刷帧函数
			var bo:BaseObj;
			var len:int = _baseObjList.length;
			
			len = _baseObjList.length;
			while(len-->0)
			{
				bo = _baseObjList[len];
				if(bo)
				{
					if(bo.usable)
					{
						if(bo.needInViewDis)
							bo.isInViewDistance = _sceneCamera.canSee(bo);
						else
							bo.isInViewDistance = true;
						
						//不在视野里， 要变个屁的alpha 啊
						if(bo.enableMask && bo.isInViewDistance)
						{
							var isInMask:Boolean = SceneUtil.isMaskXY(bo.x,bo.y);//这个暂时先这样，回头还是得优化下。。。
							bo.alpha = isInMask ? 0.5 : 1;
						}
					}
					else
					{
						removeBaseObj(bo);
					}
				}
			}
		}
		
		//创建|添加\移除\查找角色**********************************************************************************************************
		/**
		 * 向场景中添加角色
		 * @param $sc
		 */
		public function addBaseObj($baseObj:BaseObj,$parent:ObjectContainer3D=null):void
		{
			if($baseObj)
			{
				if(_baseObjList.indexOf($baseObj) == -1)
				{
					//强制改变此值,并更新到各个RenderUnit内
					$baseObj.parent = $parent || this;
					$baseObj.startRender();
					
					_baseObjList.push($baseObj);
					ZLog.add("###场景角色数量："+_baseObjList.length);
					
					$baseObj.updateNow = true;//注意这个
				}
			}
		}
		
		/**
		 * 从场景中移除角色
		 * @param $sc
		 * @param $recycle 是否池回收
		 */
		public function removeBaseObj(baseObj:BaseObj,$recycle:Boolean=true):void
		{
			//先做个判断
			if(!baseObj || !baseObj.canRemoved)
			{
				//trace("不能移除该角色, ID:"+baseObj.id+",type:"+baseObj.type);
				return;
			}
			var index:int = _baseObjList.indexOf(baseObj);
			if(index != -1)
			{
				//从数组中移除
				_baseObjList.splice(index,1);
				//清除缓动
				TweenLite.killTweensOf(baseObj);
				baseObj.stopRender();
				if($recycle)
				{
					baseObj.destroy();
					baseObj = null;
				}
				ZLog.add("###场景角色数量："+_baseObjList.length);
			}
		}
		
		/**
		 * 从场景中移除角色(通过ID和类型)
		 * @param $id
		 * @param $type
		 * @param $recycle 是否池回收
		 */
		public function removeBaseObjByID($id:int, $type:String, $recycle:Boolean=true):void
		{
			var bo:BaseObj = getBaseObjByID($id, $type);
			if(bo)
			{
				removeBaseObj(bo,$recycle);
			}
		}
		
		/**
		 * 从场景中移除角色(通过类型)
		 * @param $type
		 * @param $recycle 是否池回收
		 */
		public function removeBaseObjByType($type:String, $recycle:Boolean=true):void
		{
			var list:Array = getBaseObjByType($type);
			var len:int = list.length;
			while(len-->0)
			{
				var bo:BaseObj = list[len];
				removeBaseObj(bo,$recycle);
			}
		}
		
		/**
		 * 从场景中查找角色
		 * @parm $id 角色ID
		 * @parm $type 角色类型
		 */
		public function getBaseObjByID($id:Number, $type:String):BaseObj
		{
			var bo:BaseObj;
			var len:int = _baseObjList.length;
			while(len-->0)
			{
				bo = _baseObjList[len];
				if(bo && bo.id==$id && bo.type == $type)
				{
					return bo;
				}
			}
			return null;
		}
		
		/**
		 * 从场景中查找角色
		 * @parm $type 角色类型
		 */
		public function getBaseObjByType($type:String):Array
		{
			var typeArr:Array = [];
			var bo:BaseObj;
			var len:int = _baseObjList.length;
			while(len-->0)
			{
				bo = _baseObjList[len];
				if(bo && bo.type == $type)
				{
					typeArr.push(bo);
				}
			}
			return typeArr;
		}
	}
}