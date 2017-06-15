package com.game.engine3D.scene.render
{
	import com.game.engine3D.scene.render.vo.IRenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderResourceData;
	import com.game.engine3D.scene.render.vo.RenderUnitData3D;
	import com.game.engine3D.vo.share.CountShare;
	
	import flash.utils.Dictionary;
	
	import org.client.mainCore.ds.HashMap;
	
	/**
	 *
	 * 场景渲染缓存
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-4 下午4:36:18
	 *
	 */
	public class SceneRenderCache
	{
		/**
		 * 等待加载的换装数据
		 * 类型:Vector.<WaitLoadAvatarVo>数组的集合
		 * key:换装地址
		 */
		private static var waitingLoadAvatarsMap : HashMap = new HashMap();
		/**
		 * 渲染单元加载器
		 */
		private static var renderUnitLoaderShare : CountShare = new CountShare(120000);
		/**
		 * 资源数据计数卸载
		 */
		private static var renderResourceDataShare : CountShare = new CountShare(60000);
		/**
		 * 渲染单元数据
		 */
		private static var renderUnitDataPool : Dictionary = new Dictionary();
		/**
		 * 最大渲染单元数据数量
		 */
		public static var MAX_RENDER_UNIT_DATA_SIZE : int = 1000;
		
		public static function get dataShareCnt() : uint
		{
			return renderResourceDataShare.cacheCnt;
		}
		
		public static function get loaderShareCnt() : uint
		{
			return renderUnitLoaderShare.cacheCnt;
		}
		
		public function SceneRenderCache()
		{
		}
		
		/**
		 * 安装渲染资源数据
		 * @param fullSourchPath
		 * @param ru
		 * @param onResourceComplete
		 * @return
		 *
		 */
		public static function installRenderResourceData(meshSourchPath : String, animatorSourchPath : String, ru : IRenderUnit3D) : RenderResourceData
		{
			if (!ru)
			{
				return null;
			}
			var sourchPathKey : String = (meshSourchPath ? meshSourchPath : "") + "_" + (animatorSourchPath ? animatorSourchPath : "");
			var resData : RenderResourceData = renderResourceDataShare.getShareData(sourchPathKey) as RenderResourceData;
			if (!resData)
			{
				resData = new RenderResourceData();
				renderResourceDataShare.addShareData(sourchPathKey, resData);
			}
			resData = renderResourceDataShare.installShareData(sourchPathKey, ru) as RenderResourceData;
			return resData;
		}
		
		/**
		 * 卸载渲染资源数据
		 * @param meshSourchPath
		 * @param animatorSourchPath
		 * @param ru
		 *
		 */
		public static function uninstallRenderResourceData(meshSourchPath : String, animatorSourchPath : String, ru : IRenderUnit3D) : void
		{
			if (!ru)
			{
				return;
			}
			var sourchPathKey : String = (meshSourchPath ? meshSourchPath : "") + "_" + (animatorSourchPath ? animatorSourchPath : "");
			var resData : RenderResourceData = renderResourceDataShare.getShareData(sourchPathKey) as RenderResourceData;
			if (resData)
			{
				renderResourceDataShare.uninstallShareData(sourchPathKey, ru);
				if (resData.count <= 0 && !resData.isLoaded)
				{
					renderResourceDataShare.removeShareData(sourchPathKey);
				}
			}
		}
		
		/**
		 * 安装渲染资源
		 * @param fullSourchPath
		 * @param resourceData
		 * @param onResourceComplete
		 * @return
		 *
		 */
		public static function installRenderRes(fullSourchPath : String, resourceData : RenderResourceData) : RenderUnitLoader
		{
			if (!resourceData)
			{
				return null;
			}
			var renderLoader : RenderUnitLoader = renderUnitLoaderShare.getShareData(fullSourchPath) as RenderUnitLoader;
			if (!renderLoader)
			{
				renderLoader = new RenderUnitLoader();
				renderUnitLoaderShare.addShareData(fullSourchPath, renderLoader);
			}
			renderLoader = renderUnitLoaderShare.installShareData(fullSourchPath, resourceData) as RenderUnitLoader;
			return renderLoader;
		}
		
		/**
		 * 卸载渲染资源
		 * @param fullSourchPath
		 * @param resourceData
		 *
		 */
		public static function uninstallRenderRes(fullSourchPath : String, resourceData : RenderResourceData) : void
		{
			if (!resourceData)
			{
				return;
			}
			var renderLoader : RenderUnitLoader = renderUnitLoaderShare.getShareData(fullSourchPath) as RenderUnitLoader;
			if (renderLoader)
			{
				renderUnitLoaderShare.uninstallShareData(fullSourchPath, resourceData);
				if (renderLoader.count <= 0 && !renderLoader.isLoaded)
				{
					renderUnitLoaderShare.removeShareData(fullSourchPath);
				}
			}
		}
		
		public static function getRenderUnitData(resourceData : RenderResourceData, type : String, id : Number) : RenderUnitData3D
		{
			if (!resourceData)
			{
				return null;
			}
			var datas : Array = renderUnitDataPool[resourceData];
			var renderUnitData : RenderUnitData3D = datas ? datas.pop() : null;
			if (!renderUnitData)
			{
				renderUnitData = new RenderUnitData3D(type, id);
				renderUnitData.setResourceData(resourceData);
			}
			return renderUnitData;
		}
		
		public static function recycleRenderUnitData(resourceData : RenderResourceData, renderUnitData : RenderUnitData3D) : void
		{
			if (!resourceData)
			{
				return;
			}
			if (!renderUnitData)
			{
				return;
			}
			renderUnitData.restore();
			var datas : Array = renderUnitDataPool[resourceData];
			if (!datas)
			{
				datas = [];
				renderUnitDataPool[resourceData] = datas;
			}
			if (datas.length < MAX_RENDER_UNIT_DATA_SIZE)
				datas.push(renderUnitData);
			else
				renderUnitData.dispose();
		}
		
		public static function disposeRenderUnitDatas(resourceData : RenderResourceData) : void
		{
			if (!resourceData)
			{
				return;
			}
			var datas : Array = renderUnitDataPool[resourceData];
			if (datas)
			{
				for each (var renderUnitData : RenderUnitData3D in datas)
				{
					renderUnitData.dispose();
				}
				datas.length = 0;
			}
			renderUnitDataPool[resourceData] = null;
			delete renderUnitDataPool[resourceData];
			
			if (resourceData.renderMeshLoader)
			{
				uninstallRenderRes(resourceData.renderMeshLoader.fullSourchPath, resourceData);
			}
			if (resourceData.renderAnimatorLoader)
			{
				uninstallRenderRes(resourceData.renderAnimatorLoader.fullSourchPath, resourceData);
			}
		}
	}
}
