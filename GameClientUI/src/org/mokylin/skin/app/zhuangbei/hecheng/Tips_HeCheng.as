package org.mokylin.skin.app.zhuangbei.hecheng
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
	public class Tips_HeCheng extends feathers.controls.StateSkin
	{
		public var imgBG:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_HeCheng()
		{
			super();
			
			this.currentState = "normal";
			this.height = 103;
			this.width = 238;
			this.elementsContent = [imgBG_i(),__Tips_HeCheng_Label1_i(),__Tips_HeCheng_Label2_i(),__Tips_HeCheng_Label3_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Tips_HeCheng_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "【合成原则】";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 4;
			temp.y = 11;
			return temp;
		}

		private function __Tips_HeCheng_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "1.获得低级材料可合成高级材料。";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 12;
			temp.y = 36;
			return temp;
		}

		private function __Tips_HeCheng_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 36;
			temp.leading = 4;
			temp.text = "2.绑定材料和非绑定材料合成后将获得绑定材料。";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 217;
			temp.x = 12;
			temp.y = 56;
			return temp;
		}

		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.height = 103;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 238;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}