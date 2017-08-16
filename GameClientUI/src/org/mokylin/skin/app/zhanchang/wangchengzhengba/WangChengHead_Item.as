package org.mokylin.skin.app.zhanchang.wangchengzhengba
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
	public class WangChengHead_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var lbName:feathers.controls.Label;

		public var uiHead:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function WangChengHead_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 51;
			this.width = 143;
			this.elementsContent = [uiHead_i(),__WangChengHead_Item_UIAsset1_i(),lbName_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __WangChengHead_Item_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/weicheng/mingzidi.png";
			temp.x = 0;
			temp.y = 26;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.fontSize = 12;
			temp.text = "玩家名六个字【69级】";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 139;
			temp.x = 2;
			temp.y = 34;
			return temp;
		}

		private function uiHead_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiHead = temp;
			temp.name = "uiHead";
			temp.styleName = "ui/app/zhanchang/weicheng/1.png";
			temp.x = 6;
			temp.y = 0;
			return temp;
		}

	}
}