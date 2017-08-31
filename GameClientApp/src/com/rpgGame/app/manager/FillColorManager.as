package com.rpgGame.app.manager
{
	import com.rpgGame.coreData.cfg.QVertexColorCfgData;
	import com.rpgGame.coreData.clientConfig.Q_vertex_color;
	
	import starling.display.Image;

	/**
	 *填色管理 
	 * @author dik
	 * 
	 */
	public class FillColorManager
	{
		public function FillColorManager()
		{
		}
		
		/**
		 *填充组件 
		 * @param com
		 * 
		 */
		public static function fillImage(target:Image,fillId:int):void
		{
			var info:Q_vertex_color=QVertexColorCfgData.getVertexColorCfgById(fillId);
			if(!info){
				return;
			}
			var i:int=0;
			for(i=0;i<4;i++){
				target.setVertexColor(i,uint(info["q_color"+i]));
			}
		}
	}
}