module ChartsHelper

    def vacc_if_true(chart)
        if chart.vaccination == true
            "X"
        end
    end

    def med_if_true(chart)
        if chart.medication == true
            "X"
        end
    end

    def diag_if_true(chart)
        if chart.diagnosis == true
            "X"
        end
    end
end
