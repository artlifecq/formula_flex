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
		public var thack:feathers.controls.UIAsset;

		public var thumb:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function progress_zhufuzhiSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [thack_i(),thumb_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function thack_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			thack = temp;
			temp.name = "thack";
			temp.alpha = 0;
			temp.styleName = "ui/app/zuoqi/jindutiao_tiao1.png";
			temp.width = 220;
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

		private function thumb_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			thumb = temp;
			temp.name = "thumb";
			temp.styleName = "ui/app/zuoqi/jindutiao_tiao1.png";
			temp.width = 220;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}