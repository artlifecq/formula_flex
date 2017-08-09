package org.mokylin.skin.app.zhanchang.jingjichang
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_shang;
	import org.mokylin.skin.component.button.ButtonSkin_xiala;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JingJiPaiMing extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var imgBg:feathers.controls.UIAsset;

		public var labTitle:feathers.controls.Label;

		public var labTitle0:feathers.controls.Label;

		public var uiDown:feathers.controls.Button;

		public var uiUp:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JingJiPaiMing()
		{
			super();
			
			this.currentState = "normal";
			this.height = 27;
			this.width = 330;
			this.elementsContent = [imgBg_i(),uiDown_i(),uiUp_i(),labTitle_i(),labTitle0_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function imgBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBg = temp;
			temp.name = "imgBg";
			temp.styleName = "ui/component/text/flip_bg.png";
			temp.width = 330;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labTitle0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTitle0 = temp;
			temp.name = "labTitle0";
			temp.height = 72;
			temp.leading = 2;
			temp.letterSpacing = 0;
			temp.text = "您成功击败羽林校尉，排名升至1460";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 302;
			temp.x = 5;
			temp.y = 18;
			return temp;
		}

		private function labTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTitle = temp;
			temp.name = "labTitle";
			temp.text = "您成功击败羽林校尉，排名升至1460";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 302;
			temp.x = 5;
			temp.y = 2;
			return temp;
		}

		private function uiDown_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			uiDown = temp;
			temp.name = "uiDown";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_xiala;
			temp.x = 308;
			temp.y = 0;
			return temp;
		}

		private function uiUp_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			uiUp = temp;
			temp.name = "uiUp";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_shang;
			temp.x = 308;
			temp.y = 0;
			return temp;
		}

	}
}