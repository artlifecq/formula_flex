package org.mokylin.skin.app.zuoqi
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class progress_zhufuzhiSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var thumb:feathers.controls.UIAsset;

		public var track:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function progress_zhufuzhiSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [track_i(),thumb_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function thumb_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			thumb = temp;
			temp.name = "thumb";
			temp.height = 20;
			temp.styleName = "ui/app/zuoqi/jdt_dtiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function track_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			track = temp;
			temp.name = "track";
			temp.alpha = 0;
			temp.height = 20;
			temp.styleName = "ui/app/zuoqi/jdt_dtiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}