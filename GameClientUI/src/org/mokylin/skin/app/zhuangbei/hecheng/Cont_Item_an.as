package org.mokylin.skin.app.zhuangbei.hecheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.over.SelectBtn;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Cont_Item_an extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_over:feathers.controls.Button;

		public var lb_Dispaly:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Cont_Item_an()
		{
			super();
			
			this.currentState = "normal";
			this.height = 32;
			this.width = 245;
			this.elementsContent = [__Cont_Item_an_UIAsset1_i(),lb_Dispaly_i(),btn_over_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Cont_Item_an_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 32;
			temp.styleName = "ui/app/zhuangbei/hecheng/shense_di.jpg";
			temp.width = 245;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_over_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_over = temp;
			temp.name = "btn_over";
			temp.height = 32;
			temp.styleClass = org.mokylin.skin.common.over.SelectBtn;
			temp.width = 245;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lb_Dispaly_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_Dispaly = temp;
			temp.name = "lb_Dispaly";
			temp.htmlText = "中级鉴定图纸<font color='#bea757'>(10)</font>";
			temp.letterSpacing = -1;
			temp.fontSize = 16;
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 210;
			temp.x = 32;
			temp.y = 6;
			return temp;
		}

	}
}