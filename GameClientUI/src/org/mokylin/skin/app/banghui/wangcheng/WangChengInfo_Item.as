package org.mokylin.skin.app.banghui.wangcheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class WangChengInfo_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var lbTxt:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function WangChengInfo_Item()
		{
			super();
			
			this.currentState = "normal";
			this.width = 165;
			this.elementsContent = [bg_i(),lbTxt_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/app/banghui/wangcheng/dianban.png";
			temp.top = 0;
			return temp;
		}

		private function lbTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTxt = temp;
			temp.name = "lbTxt";
			temp.bottom = 3;
			temp.leading = 2;
			temp.left = 2;
			temp.right = 3;
			temp.text = "帮派名称七个字";
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.top = 3;
			return temp;
		}

	}
}