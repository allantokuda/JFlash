class TermsController < ApplicationController
  # GET /terms
  # GET /terms.json
  def index
    @terms = Term.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @terms }
    end
  end

  # GET /terms/1
  # GET /terms/1.json
  def show
    @term = Term.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @term }
    end
  end

  # GET /terms/new
  # GET /terms/new.json
  def new
    @term = Term.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @term }
    end
  end

  # GET /terms/1/edit
  def edit
    @term = Term.find(params[:id])
  end

  # GET /terms/1/quiz
  def quiz

		def getForm(term, form)
			return case form
				when "english"
					term.english
				when "romanji"
					term.romanji
				when "kana"
					term.kana
				when "kanji"
					term.kanji
			end
		end
		
		@term = Term.find(:first, :order=>'random()')

		from_form = params[:from] || "kana"
		to_form   = params[:to  ] || "english"

		@prompt = getForm(@term, from_form)
		@answer = getForm(@term, to_form)

		if (params[:from] == "english" and params[:to] == "kanji")
			@second_answer = getForm(@term, "kana")
		end

    respond_to do |format|
      format.html # quiz.html.erb
    end
  end

  # POST /terms
  # POST /terms.json
  def create
    @term = Term.new(params[:term])

    respond_to do |format|
      if @term.save
        format.html { redirect_to @term, notice: 'Term was successfully created.' }
        format.json { render json: @term, status: :created, location: @term }
      else
        format.html { render action: "new" }
        format.json { render json: @term.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /terms/1
  # PUT /terms/1.json
  def update
    @term = Term.find(params[:id])

    respond_to do |format|
      if @term.update_attributes(params[:term])
        format.html { redirect_to @term, notice: 'Term was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @term.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /terms/1
  # DELETE /terms/1.json
  def destroy
    @term = Term.find(params[:id])
    @term.destroy

    respond_to do |format|
      format.html { redirect_to terms_url }
      format.json { head :ok }
    end
  end
end
