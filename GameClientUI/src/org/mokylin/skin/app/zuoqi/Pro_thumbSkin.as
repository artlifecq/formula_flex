package org.mokylin.skin.app.zuoqi
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Pro_thumbSkin extends feathers.controls.StateSkin
	{
		public var thumb:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Pro_thumbSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 14;
			this.width = 220;
			this.elementsContent = [thumb_i(),__Pro_thumbSkin_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Pro_thumbSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 14;
			temp.styleName = "ui/app/zuoqi/tiao.png";
			temp.x = 218;
			temp.y = -1;
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