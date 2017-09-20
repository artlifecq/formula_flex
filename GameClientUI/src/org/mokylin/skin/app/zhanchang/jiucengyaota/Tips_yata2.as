package org.mokylin.skin.app.zhanchang.jiucengyaota
{
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.zhanchang.jiucengyaota.Tips_yaota;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Tips_yata2 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var imgBG:feathers.controls.UIAsset;

		public var skinTips:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_yata2()
		{
			super();
			
			this.currentState = "normal";
			this.height = 165;
			this.width = 380;
			this.elementsContent = [imgBG_i(),skinTips_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.height = 165;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 380;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function skinTips_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinTips = temp;
			temp.name = "skinTips";
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.jiucengyaota.Tips_yaota()
			temp.skin = skin
			temp.x = 10;
			temp.y = 10;
			return temp;
		}

	}
}