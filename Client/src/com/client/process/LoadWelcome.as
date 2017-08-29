package com.client.process
{
	import com.client.view.loading.ResLoadingView;
	import com.game.engine3D.process.BaseProcess;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.SceneRenderCache;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.game.engine3D.scene.render.vo.RenderResourceData;
	import com.gameClient.log.GameLog;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.netData.player.bean.MyPlayerInfo;
	import com.rpgGame.statistics.Statistics;
	
	import flash.events.Event;
	
	import away3d.loaders.multi.MultiLoadData;
	
	import feathers.themes.ThemeLoader;
	
	/**
	 *加载角色欢迎相关资源
	 * @author dik
	 * 
	 */
	public class LoadWelcome extends BaseProcess
	{
		private static const UI_WEL : String = "huanying";
		
		public function LoadWelcome()
		{
			super();
		}
		
		override public function getState() : String
		{
			return ProcessState.STATE_LOAD_WEL;
		}
		
		override public function startProcess() : void
		{
			super.startProcess();
			var info:MyPlayerInfo=ClientConfig.loginData;
			var lv:int;
			for(var i:int=0;i<info.attributes;i++){
				if(info.attributes[i].type==CharAttributeType.LV){
					lv=info.attributes[i].value;
					break;
				}
			}
			if(lv>1){
				completeProcess();
				return;
			}
			GameLog.addShow("开始加载欢迎UI素材...", UI_WEL);
			
			var loader:ThemeLoader = new ThemeLoader();
			loader.load( ClientConfig.getUI(UI_WEL), onFinish, onProgress, onResError);
		}
		override public function completeProcess():void
		{
			super.completeProcess();
			Statistics.intance.pushNode(Statistics.STEP_LOAD_WELCOME,"欢迎ui加载成功");
		}
		private function onProgress(progress:Number) : void
		{
			setProcessPercent(progress);
		}
		
		private function onFinish(loader : ThemeLoader) : void
		{
			GameLog.addShow("欢迎UI素材加载完成...");
			var _renderParamData:RenderParamData3D=new RenderParamData3D(0,"effect_ui",ClientConfig.getEffect("ui_kaishiyouxi"));
			var uint:RenderUnit3D=RenderUnit3D.create(_renderParamData);
			var _renderResourceData:RenderResourceData=SceneRenderCache.installRenderResourceData(_renderParamData.sourcePath,_renderParamData.animatorSourchPath,uint);
			_renderResourceData.setResCompleteCallBack(onSetRenderResourceData);
			_renderResourceData.setResErrorCallBack(onRenderResourceDataError);
			_renderResourceData.loadSource(_renderParamData.sourcePath, _renderParamData.animatorSourchPath, _renderParamData.priority);
		}
		
		private function onSetRenderResourceData(resData : RenderResourceData) : void
		{
			if (resData)
			{
				completeProcess();
			}
		}
		
		private function onRenderResourceDataError(resData : RenderResourceData) : void
		{
			//执行错误回调
			GameLog.addShow("加载欢迎素材错误...");
			completeProcess();
		}

		
		private function onResError(ld : MultiLoadData, e : Event) : void
		{
			ResLoadingView.instance.title = "欢迎UI素材加载错误：" + UI_WEL;
			GameLog.addShow("欢迎UI素材加载错误：" + UI_WEL);
		}
	}
}