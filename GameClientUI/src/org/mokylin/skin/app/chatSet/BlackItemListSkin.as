package org.mokylin.skin.app.chatSet
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BlackItemListSkin extends feathers.controls.StateSkin
	{
		public var name:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BlackItemListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__BlackItemListSkin_UIAsset1_i(),name_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __BlackItemListSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 31;
			temp.styleName = "ui/common/liebiao/liebiaotiao.png";
			temp.width = 258;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			name = temp;
			temp.name = "name";
			temp.fontSize = 16;
			temp.text = "标签";
			temp.underline = true;
			temp.width = 198;
			temp.x = 14;
			temp.y = 4;
			return temp;
		}

	}
}