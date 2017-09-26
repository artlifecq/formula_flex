package org.mokylin.skin.app.activety.jixiantiaozhan
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JiXianQieHuan extends feathers.controls.StateSkin
	{
		public var uiWords:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JiXianQieHuan()
		{
			super();
			
			this.currentState = "normal";
			this.height = 72;
			this.width = 669;
			this.elementsContent = [__JiXianQieHuan_UIAsset1_i(),uiWords_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __JiXianQieHuan_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/BOSSyibeijisha_bg1.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiWords_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiWords = temp;
			temp.name = "uiWords";
			temp.styleName = "ui/app/activety/jixiantiaozhan/BOSSyibeijisha.png";
			temp.x = 32;
			temp.y = 17;
			return temp;
		}

	}
}