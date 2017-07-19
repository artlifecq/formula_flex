package org.mokylin.skin.app.meiren
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.meiren.number.UINumberMeirenshuzi;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MeiRen_Daojishi extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var lbFen:feathers.controls.UIAsset;

		public var lbMiao:feathers.controls.UIAsset;

		public var lbTime:feathers.controls.UIAsset;

		public var numFen:feathers.controls.UINumber;

		public var numMiao:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MeiRen_Daojishi()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),lbTime_i(),lbFen_i(),lbMiao_i(),numFen_i(),numMiao_i()];
			
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
			temp.height = 27;
			temp.styleName = "ui/app/meiren/shiqubgtishibeijing.png";
			temp.width = 202;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbFen_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			lbFen = temp;
			temp.name = "lbFen";
			temp.styleName = "ui/app/meiren/fen.png";
			temp.x = 119;
			temp.y = 4;
			return temp;
		}

		private function lbMiao_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			lbMiao = temp;
			temp.name = "lbMiao";
			temp.styleName = "ui/app/meiren/miao.png";
			temp.x = 175;
			temp.y = 4;
			return temp;
		}

		private function lbTime_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			lbTime = temp;
			temp.name = "lbTime";
			temp.styleName = "ui/app/meiren/shengyushijian.png";
			temp.x = 10;
			temp.y = 5;
			return temp;
		}

		private function numFen_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numFen = temp;
			temp.name = "numFen";
			temp.gap = -1;
			temp.height = 18;
			temp.label = "00";
			temp.styleClass = org.mokylin.skin.app.meiren.number.UINumberMeirenshuzi;
			temp.width = 27;
			temp.x = 86;
			temp.y = 4;
			return temp;
		}

		private function numMiao_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numMiao = temp;
			temp.name = "numMiao";
			temp.gap = -1;
			temp.height = 18;
			temp.label = "00";
			temp.styleClass = org.mokylin.skin.app.meiren.number.UINumberMeirenshuzi;
			temp.width = 27;
			temp.x = 142;
			temp.y = 4;
			return temp;
		}

	}
}