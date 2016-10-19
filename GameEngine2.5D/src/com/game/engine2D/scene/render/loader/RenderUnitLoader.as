package com.game.engine2D.scene.render.loader
{
	import com.game.engine2D.Scene;
	import com.game.engine2D.SceneCharacter;
	import com.game.engine2D.scene.render.IRenderUnit;
	import com.game.engine2D.scene.render.RenderSet;
	import com.game.engine2D.scene.render.RenderUnit;
	import com.game.engine2D.scene.render.vo.RenderParamData;
	import com.game.engine2D.scene.render.vo.XmlImgData;
	import com.game.engine2D.tools.SceneCache;
	import com.game.engine2D.vo.BaseObj;
	import com.game.mainCore.libCore.utils.LoadBlackListUtils;
	
	/**
	 * @private
	 * 换装加载器
	 * @author Carver
	 * @modifier L.L.M.Sunny
	 * 修改时间：2015-4-21 上午10:33:37
	 */
	public class RenderUnitLoader
	{
		/**特殊的加载函数，比如air编辑器里用到的，只会传入一个url*/
		public static var specailLoadFun:Function;
		
		/**
		 * @private
		 * 加载换装部件（单人)(最基本的方法）
		 *  @param $apd 换装数据
		 *  return
		 */
		public static function loadRenderUnit($ap:IRenderUnit,$status:uint, isStarling:Boolean = false):void
		{
			var apd:RenderParamData = $ap.data as RenderParamData;
			//如果数据有效
			if(
				$ap.usable
				&& 
				apd.sourcePath!=null && apd.sourcePath!=""
				&&
				$status!=0
			)
			{
				var fullSourchPath:String = apd.getFullSourcePath($status);
				var is404Error:Boolean = LoadBlackListUtils.getIs404Error(fullSourchPath,3); 
				if(is404Error)
				{
//					trace("404Error : ",fullSourchPath);
					return;
				}
				var xid:XmlImgData = SceneCache.renderUnitCountShare.getShareData(fullSourchPath) as XmlImgData;
				if(!xid)//如果不在xml缓存中，则加载 
				{
					//创建一个空的缓存数据对象
					xid = new XmlImgData();
					xid.isStarling = isStarling;
					SceneCache.renderUnitCountShare.addShareData(fullSourchPath,xid);
					//添加进等待队列
					SceneCache.addWaitingLoadAvatar($ap,fullSourchPath);//注意apd在这里不要复制副本
					//记录加载函数（只需在首次赋值）
					xid.loadSource(fullSourchPath,apd);//开始加载
				}
				else
				{ 
					if(xid.aps == null)//如果没有没有内容，则放到待加载的数组里
					{
						SceneCache.addWaitingLoadAvatar($ap,fullSourchPath);
					}
					else//否则创建并显示部件,添加换装
					{
						SceneCache.addWaitingAddAvatar($ap, xid.aps);
					}
				}
			}
			else//如果xml地址数据无效,直接执行回调
			{
				if(apd.sourcePath!=null || apd.sourcePath!="")
				{
					trace("什么嘛，资源地址为空，播放个鬼");
				}
				dataError($ap);
			}
		}
		
		private static function dataError($iap:IRenderUnit):void
		{
			//			trace("靠,靠,靠....avatarPart加载出错啊.....");
			var $ap:RenderUnit = $iap as RenderUnit;
			if($ap)
			{
				var bo:BaseObj = Scene.scene.getSceneObjByAp($ap);
				if(bo)
				{
					if(bo is SceneCharacter)
					{
						(bo as SceneCharacter).avatar.removeRenderUnit($ap);
					}
					else if(bo is RenderSet)
					{
						(bo as RenderSet).removeRenderUnit($ap);
					}
					else if(bo is RenderUnit)
					{
						Scene.scene.removeSceneObj(bo);
					}
				}
			}
		}
	}
}
